module Games
  class Puissance4sController < ApplicationController
    def create
      puissance_4 = Games::Puissance4.create(grid: Games::Puissance4.new_grid, gameover: 2)
      redirect_to games_puissance4_path(puissance_4)
    end

    def show
      @puissance_4 = Games::Puissance4.find(params[:id])
    end

    def update
      @puissance_4 = Games::Puissance4.find(params[:id])

      if @puissance_4.gameover == 2 || params[:reset]
        params[:reset] ? @puissance_4.reset_game : @puissance_4.compute_turns(params[:column].to_i)

        @puissance_4.save
      end

      redirect_to games_puissance4_path(@puissance_4)
    end
  end
end
