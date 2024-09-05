module Games
  class RollDice < ApplicationRecord
    belongs_to :roll

    COLORS = %w[red blue yellow green]

    validates :faces, presence: true,
                      numericality: { greater_than_or_equal_to: 2 }
    validates :color, presence: true,
                      inclusion: { in: COLORS }

    scope :ordered, -> { order(id: :desc) }

    def roll_dice
      self.value = rand(1..(self.faces))
    end
  end
end
