module Games
  class PuzzlesController < ApplicationController
    def index
      @puzzle = Games::Puzzle.new
    end

    def create
      @puzzle = Games::Puzzle.new(puzzle_params)
      @puzzle.reset_game

      if @puzzle.save
        redirect_to games_puzzle_path(@puzzle)
      else
        render "games/puzzles/index", status: :unprocessable_entity
      end
    end

    def show
      @puzzle = Games::Puzzle.find(params[:id])
    end

    def update
      @puzzle = Games::Puzzle.find(params[:id])

      if @puzzle.gameover == 2 || params[:reset]
        params[:reset] ? @puzzle.reset_game : @puzzle.compute_turns(params[:pos].to_i)
        @puzzle.save
      end

      redirect_to games_puzzle_path(@puzzle)
    end

    private

    def puzzle_params
      params.require(:games_puzzle).permit(:pseudo, :size)
    end
  end
end
