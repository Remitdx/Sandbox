module Utilities
  class RollDicesController < ApplicationController
    allow_unauthenticated_access
    include Games

    before_action :set_dice, only: [ :edit, :update, :destroy ]
    before_action :set_roll, only: [ :new, :edit, :update, :create ]
    before_action :set_scores, only: [ :update, :create, :destroy ]

    def new
      @dice = Utilities::RollDice.new
    end

    def create
      @dice = Utilities::RollDice.new(dice_params)
      @dice.roll_id = params[:roll_id]
      if @dice.save
        respond_to do |format|
          format.html { redirect_to utilities_roll_path(@dice.roll_id) }
          format.turbo_stream
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @dice.update(dice_params.merge(value: nil))
        respond_to do |format|
          format.html { redirect_to utilities_roll_path(@dice.roll_id) }
          format.turbo_stream
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @dice.destroy
      respond_to do |format|
        format.html { redirect_to utilities_roll_path }
        format.turbo_stream
      end
    end

    private

    def set_dice
      @dice = RollDice.find(params[:id])
    end

    def set_roll
      @roll = Utilities::Roll.find(params[:roll_id])
    end

    def set_scores
      @scores = Utilities::RollDicesController.reset_scores
    end

    def dice_params
      params.require(:utilities_roll_dice).permit(:faces, :color)
    end
  end
end
