module Games
  class Map < ApplicationRecord
    has_many :tiles, dependent: :destroy
    belongs_to :risk

    def generate_tiles
      n = size * rand(12..16)
      n.times do
        Games::Tile.create(map_id: self.id, field: Games::Tile::FIELD[[1, 2, 3, 5].sample])
      end
    end
  end
end
