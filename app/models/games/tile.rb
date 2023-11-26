module Games
  class Tile < ApplicationRecord
    belongs_to :map

    FIELD = {
      1 => 'field',
      2 => 'woods',
      3 => 'mountains'
    }
  end
end
