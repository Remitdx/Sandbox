module Games
  class RollDice < ApplicationRecord
    belongs_to :roll

    COLORS = %w(red blue yellow green)

    validates :faces, presence: true
    validates :color, presence: true, inclusion: { in: COLORS }

    scope :ordered, -> { order(id: :desc) }
  end
end
