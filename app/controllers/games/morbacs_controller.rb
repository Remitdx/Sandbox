module Games
  class MorbacsController < ApplicationController
    def create
      morbac = Games::Morbac.create()
      redirect_to games_morbac_path(morbac)
    end

    def show
      @morbac = Games::Morbac.find(params[:id])
    end

    def update
      @morbac = Games::Morbac.find(params[:id])

      if @morbac.gameover == 2 || params[:reset]
        params[:reset] ? @morbac.reset_game : @morbac.compute_turns(params[:pos].to_i)
        @morbac.save
      end

      redirect_to games_morbac_path(@morbac)
    end
  end
end
