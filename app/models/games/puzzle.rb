module Games
  class Puzzle < ApplicationRecord
    validates :pseudo, presence: true
    validates :value, presence: true
    validates :gameover, presence: true
    validates :size, inclusion: { in: 3..5 }

    def generate_solvable_shuffle
      self.value = *(0..(self.size * self.size - 1))
      self.value.shuffle
      # until solvable shuffle again
      self
    end

    private

    def solvable?
    end
  end
end
