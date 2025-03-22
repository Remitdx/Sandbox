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
      valid_play?(self, index) ? swap_tiles(self, index) : self
      # play valid ?
      # permuter 0 et la tile cliquée
      # gameover ? partie gagnée ?
      # self
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

    def valid_play?(puzzle, index)
      index_x = index % puzzle.size
      index_y = index / puzzle.size
      empty_tile = puzzle.value.index(0)
      empty_tile_x = empty_tile % puzzle.size
      empty_tile_y = empty_tile / puzzle.size
      (index_x - empty_tile_x).abs + (index_y - empty_tile_y).abs == 1
    end

    def swap_tiles(puzzle, index)
      raise
    end
  end
end
