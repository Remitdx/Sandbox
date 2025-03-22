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
      self.gameover = 0 if game_win?(self)
      self
    end

    private

    def generate_solvable_shuffle
      self.counter = 0
      self.value = *(0..(self.size * self.size - 1))
      self.value.shuffle!
      until solvable?(self)
        self.value.shuffle!
      end
      self
    end

    def solvable?(puzzle)
      count = 0
      for i in 0...(puzzle.size * puzzle.size - 1)
        if puzzle.value[i] > puzzle.value[i+1] && puzzle.value[i] != 0 && puzzle.value[i+1] != 0
          count += 1
        end
      end
      count.even?
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
      empty_tile = puzzle.value.index(0)
      puzzle.value[empty_tile], puzzle.value[index] = puzzle.value[index], puzzle.value[empty_tile]
      self.counter += 1
      self
    end

    def game_win?(puzzle)
      count = 0
      for i in 0...(puzzle.size * puzzle.size - 1)
        if puzzle.value[i] > puzzle.value[i+1]
          count += 1
        end
      end
      count == 0
    end
  end
end
