module Games
  class RollsController < ApplicationController
    def create
      @roll = Games::Roll.create
      redirect_to games_roll_path(@roll)
    end

    def show
      @roll = Games::Roll.find(params[:id])
      @dices = Games::RollDice.where(roll_id: @roll)
    end
  end
end
