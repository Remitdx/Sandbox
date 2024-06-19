module Games
  class MorbacsController < ApplicationController
    def create
      morbac = Games::Morbac.create()
      redirect_to games_morbac_path(morbac)
    end

    def show
      @morbac = Games::Morbac.find(params[:id]).value
    end

    def update
      morbac = Games::Morbac.find(params[:id])

      if params[:reset]
        morbac.update(value: [2, 2, 2, 2, 2, 2, 2, 2, 2])
        redirect_to games_morbac_path(morbac) and return
      end

      value = morbac.value
      value[params[:pos].to_i] = 0 if value[params[:pos].to_i].to_i > 1
      morbac.update(value: value)
      redirect_to games_morbac_path(morbac)
    end
  end
end
