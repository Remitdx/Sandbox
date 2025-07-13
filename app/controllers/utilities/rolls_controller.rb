module Utilities
  class RollsController < ApplicationController
    include Games

    before_action :set_roll, only: [ :show, :update ]

    def create
      @roll = Utilities::Roll.create
      redirect_to utilities_roll_path(@roll)
    end

    def show
      @dices = Utilities::RollDice.where(roll_id: @roll).ordered
      @scores = scores_calculation(@dices)
    end

    def update
      @dices = Utilities::RollDice.includes([:roll]).where(roll_id: @roll).ordered
      roll_all_dices(@dices)
      Utilities::RollDice.includes([:roll]).transaction do
        @dices.each { |dice| dice.save }
      end
      @scores = scores_calculation(@dices)
      respond_to do |format|
        format.html { redirect_to utilities_roll_path(@roll) }
        format.turbo_stream
      end
    end

    private

    def scores_calculation(dices)
      red, blue, yellow, green, total = [ 0, 0, 0, 0, 0 ]
      dices.each do |dice|
        return Utilities::RollsController.reset_scores if dice.value.nil?
        total += dice.value
        case dice.color
        when "red"
          red += dice.value
        when "blue"
          blue += dice.value
        when "yellow"
          yellow += dice.value
        when "green"
          green += dice.value
        end
      end
      [ red, blue, yellow, green, total ]
    end

    def set_roll
      @roll = Utilities::Roll.find(params[:id])
    end

    def roll_all_dices(dices)
      return [] if dices.empty?
      dices.map { |dice| dice.roll_dice }
    end
  end
end
