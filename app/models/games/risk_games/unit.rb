module Games
  class Unit < ApplicationRecord
    belongs_to :player
  end
end
