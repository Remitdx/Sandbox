module Games
  class EscapesController < ApplicationController
    def create
      escape = Games::Escape.new(Games::Escapes::Constants::RESPONSES[0])
      escape.set_game_parameters
      escape.save
      redirect_to games_escape_path(escape)
    end

    def show
      @escape = Games::Escape.find(params[:id])
    end

    def update
      @escape = Games::Escape.find(params[:id])
      event = @escape.recognize_event(params[:id], params[:character_x].to_i, params[:character_y].to_i)

      unless event.empty?
        @escape.update(Games::Escapes::Constants::RESPONSES[event.keys.first])
      end

      respond_to do |format|
        format.html { redirect_to games_escape_path(@escape) }
        format.turbo_stream
      end
    end
  end
end
