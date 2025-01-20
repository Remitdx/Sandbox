module Games
  class EscapesController < ApplicationController
    def create
      escape = Games::Escape.create(step: 0, text: 0, map: Games::Escapes::Maps.intro_map,
                                    parameters: { map_x: 15, map_y: 8, character_x: 1, character_y: 1 })

                                    redirect_to games_escape_path(escape)
    end

    def show
      @escape = Games::Escape.find(params[:id])
    end

    def update
      @escape = Games::Escape.find(params[:id])

      redirect_to games_escape_path(@escape) if params[:step].to_i == @escape.step and return

      case params[:step]
      when "1"
        @escape.text += 1
        @escape.parameters[:character_x] = params[:character_x]
        @escape.parameters[:character_y] = params[:character_y]
        @escape.step += 1
      when "2"
        @escape.set_game_parameters
        @escape.text += 1
        @escape.step += 1
        @escape.map = Games::Escapes::Maps.bunker_map
      end

      @escape.save
      respond_to do |format|
          format.html { redirect_to games_escape_path(@escape) }
          format.turbo_stream
        end
    end
  end
end
