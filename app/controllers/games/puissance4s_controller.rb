module Games
  class Puissance4sController < ApplicationController
    def create
      puissance_4 = Games::Puissance4.create(grid: [
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0]
                                                  ])
      redirect_to games_puissance4_path(puissance_4)
    end

    def show
      @puissance_4 = Games::Puissance4.find(params[:id])
    end
  end
end
