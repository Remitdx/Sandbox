module Games
  class PuzzlesController < ApplicationController
    def index
      @puzzle = Games::Puzzle.new
    end

    def create
      @puzzle = Games::Puzzle.new(puzzle_params)
      @puzzle.gameover = 0
      @puzzle.generate_solvable_shuffle

      if @puzzle.save
        redirect_to games_puzzle_path(@puzzle)
      else
        render 'games/puzzles/index', status: :unprocessable_entity
      end
    end

    def show
      @puzzle = Games::Puzzle.find(params[:id])
    end

    private

    def puzzle_params
      params.require(:games_puzzle).permit(:pseudo, :size)
    end
  end
end
