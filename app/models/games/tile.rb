module Games
  class Tile < ApplicationRecord
    belongs_to :map
  end
end
