module Games
  class Map < ApplicationRecord
    has_many :tiles, dependent: :destroy
    belongs_to :risk

    def generate_tiles
      n = size * rand(12..15)
      n.times do
        Games::Tile.create(map_id: self.id )
      end
    end
  end
end
