module Games
  class EscapesController < ApplicationController
    def create
      escape = Games::Escape.create(step: 0, parameters: { map: Games::Escape.intro_map,
                                                           map_x: 15, map_y: 8,
                                                           character_x: 1, character_y: 1 })
      redirect_to games_escape_path(escape)
    end

    def show
      @escape = Games::Escape.find(params[:id])
    end

    def update
      @escape = Games::Escape.find(params[:id])

      if @escape.step == 0
        @escape.step = 1
        @escape.set_game_parameters
      end

      @escape.save
      redirect_to games_escape_path(@escape)
    end
  end
end
