module Games
  module RiskGames
    class Tile < ApplicationRecord
      belongs_to :map

      FIELD = {
        1 => 'field',
        2 => 'wood',
        3 => 'rock',
        4 => 'water',
        5 => 'clay'
      }
  end
  end
end
