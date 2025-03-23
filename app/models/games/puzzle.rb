module Games
  class Puzzle < ApplicationRecord
    validates :pseudo, presence: true
    validates :value, presence: true
    validates :gameover, presence: true
    validates :size, inclusion: { in: 3..5 }

    def compute_turns(index)
      valid_play?(self, index) ? swap_tiles(self, index) : self
      self.gameover = 0 if game_win?(self)
      self
    end

    def generate_solvable_shuffle
      self.counter = 0
      self.value = *(0...(self.size * self.size))
      self.value.shuffle!
      until solvable?(self)
        self.value.shuffle!
      end
      self
    end

    private

    def solvable?(puzzle)
      inversions = count_inversions(puzzle)

      (puzzle.size.odd? && inversions.even?) ||
      (puzzle.size.even? && inversions.even? && (puzzle.value.index(0) / puzzle.size).even?) ||
      (puzzle.size.even? && inversions.odd? && (puzzle.value.index(0) / puzzle.size).odd?)
    end

    def count_inversions(puzzle)
      count = 0
      for i in 0...(puzzle.size * puzzle.size)
        for j in (i + 1)..(puzzle.size * puzzle.size)
          if puzzle.value[j] && puzzle.value[i] && puzzle.value[j] != 0 && puzzle.value[i] != 0 && puzzle.value[i] > puzzle.value[j]
            count += 1
          end
        end
      end
      count
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
