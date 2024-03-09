module Games
  class RollsController < ApplicationController
    before_action :set_roll, :set_dices, only: [:show, :update]

    def create
      @roll = Games::Roll.create
      redirect_to games_roll_path(@roll)
    end

    def show
    end

    def update
      roll_all_dices(@dices)
      Games::RollDice.transaction do
        @dices.each { |dice| dice.save }
      end
      redirect_to games_roll_path(@roll)
    end

    private

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
