module Games
  class RollsController < ApplicationController
    include Games

    before_action :set_roll, :set_dices, only: [ :show, :update ]

    def create
      @roll = Games::Roll.create
      redirect_to games_roll_path(@roll)
    end

    def show
      @scores = scores_calculation(@dices)
    end

    def update
      roll_all_dices(@dices)
      Games::RollDice.transaction do
        @dices.each { |dice| dice.save }
      end
      @scores = scores_calculation(@dices)
      respond_to do |format|
        format.html { redirect_to games_roll_path(@roll) }
        format.turbo_stream
      end
    end

    private

    def scores_calculation(dices)
      red, blue, yellow, green, total = [ 0, 0, 0, 0, 0 ]
      dices.each do |dice|
        return Games::RollsController.reset_scores if dice.value.nil?
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
      @roll = Games::Roll.find(params[:id])
    end

    def set_dices
      @dices = Games::RollDice.where(roll_id: @roll).ordered
    end

    def roll_all_dices(dices)
      return [] if dices.empty?
      dices.map { |dice| dice.roll_dice }
    end
  end
end
