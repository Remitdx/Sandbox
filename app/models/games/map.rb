module Games
  class Map < ApplicationRecord
    has_many :tiles, dependent: :destroy
    belongs_to :risk

    validates :size, :lines, :columns, presence: true

    def roll_dimensions
      self.lines = rand((size)..(size + 3))
      self.columns = rand(10..22)
    end

    def generate_tiles
      (lines*columns).times do
        Games::Tile.create(map_id: self.id, field: Games::Tile::FIELD[[1, 2, 3, 5].sample])
      end
    end
  end
end
