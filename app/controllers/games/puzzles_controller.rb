module Games
  class PuzzlesController < ApplicationController
    allow_unauthenticated_access

    def index
      @puzzle = Games::Puzzle.new
      @best5 = Games::Puzzle.where(size: 5, gameover: 0).order(counter: :asc).first
      @best4 = Games::Puzzle.where(size: 4, gameover: 0).order(counter: :asc).first
      @best3 = Games::Puzzle.where(size: 3, gameover: 0).order(counter: :asc).first
    end

    def create
      @puzzle = Games::Puzzle.new(puzzle_params)
      @puzzle.generate_solvable_shuffle
      @puzzle.gameover = 2

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

      if @puzzle.gameover == 2
        @puzzle.compute_turns(params[:pos].to_i)
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
