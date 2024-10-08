module Games
  module RiskGames
    class Map < ApplicationRecord
      has_many :tiles, dependent: :destroy
      belongs_to :risk

      validates :size, :lines, :columns, presence: true

      def roll_dimensions
        self.lines = rand((size)..(size + 3))
        self.columns = rand(10..20)
      end

      def generate_tiles
        for y in 1..lines do
          for x in 1..columns do
            Games::RiskGames::Tile.create!(map_id: self.id, field: Games::RiskGames::Tile::FIELD[[ 1, 2, 3, 5 ].sample], x: x, y: y)
          end
        end
      end
    end
  end
end
