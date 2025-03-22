module Games
  class Puzzle < ApplicationRecord
    validates :pseudo, presence: true
    validates :value, presence: true
    validates :gameover, presence: true
    validates :size, inclusion: { in: 3..5 }

    def reset_game
      generate_solvable_shuffle
      self.gameover = 2
      self
    end

    def compute_turns(index)
      raise
      valid_play?(self.value, index) ? @puzzle.swap_tiles(params[:pos].to_i) : @puzzle
      # play valid ?
      # permuter 0 et la tile cliquée
      # gameover ? partie gagnée ?
      self
    end

    private

    def generate_solvable_shuffle
      self.value = *(0..(self.size * self.size - 1))
      self.value.shuffle!
      # until solvable shuffle again
      self
    end

    def solvable?
    end

    def valid_play?(array, index)
    end

  end
end
