module Games
  class PuzzlesController < ApplicationController
    def index
      @puzzle = Games::Puzzle.new
    end
  end
end
