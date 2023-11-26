module Games
  class Map < ApplicationRecord
    has_many :tiles, dependent: :destroy
    belongs_to :risk
  end
end
