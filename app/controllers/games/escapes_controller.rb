module Games
  class EscapesController < ApplicationController
    def create
      escape = Games::Escape.create(step: 0)
      redirect_to games_escape_path(escape)
    end

    def show
      @escape = Games::Escape.find(params[:id])
      @map = @escape.intro_map
    end

    def update
      raise
      @escape = Games::Escape.find(params[:id])
    end
  end
end
