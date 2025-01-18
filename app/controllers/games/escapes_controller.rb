module Games
  class EscapesController < ApplicationController
    def create
      escape = Games::Escape.create(room: 0, text: 0, parameters: { map: Games::Escape.intro_map,
                                                                    map_x: 15, map_y: 8,
                                                                    character_x: 1, character_y: 1 })
      redirect_to games_escape_path(escape)
    end

    def show
      @escape = Games::Escape.find(params[:id])
    end

    def update
      @escape = Games::Escape.find(params[:id])

      case params[:input]
      when 'text'
        @escape.text += 1
        @escape.parameters[:character_x] = params[:character_x]
        @escape.parameters[:character_y] = params[:character_y]
      when 'room'
        if @escape.room == 0
          @escape.room = 1
          @escape.set_game_parameters
        end
      end

      @escape.save
      respond_to do |format|
          format.html { redirect_to games_escape_path(@escape) }
          format.turbo_stream
        end
    end
  end
end
