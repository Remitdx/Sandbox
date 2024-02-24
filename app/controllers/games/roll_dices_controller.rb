module Games
  class RollDicesController < ApplicationController
    before_action :set_dice, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
      @dice = Games::RollDice.new
      @roll = Games::Roll.find(params[:roll_id])
    end

    def create
      @dice = Games::RollDice.new(dice_params)
      @dice.roll_id = params[:roll_id]
      if @dice.save
        redirect_to games_roll_path(@dice.roll_id), notice: "Dice was successfully created."
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @dice.update(dice_params)
        redirect_to games_roll_path(@dice.roll_id), notice: "Dice was successfully updated."
      else
        render :new
      end
    end

    def destroy
      @dice.destroy
      redirect_to games_roll_path, notice: "Quote was successfully destroyed."
    end

    private

    def set_dice
      @dice = RollDice.find(params[:id])
    end

    def dice_params
      params.require(:games_roll_dice).permit(:faces, :color)
    end
  end
end
