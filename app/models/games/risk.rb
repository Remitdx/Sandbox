module Games
  class Risk < ApplicationRecord
    has_many :players, dependent: :destroy
    has_many :maps, dependent: :destroy

    MODE = {
      1 => 'versus AI',
      2 => 'Multiplayer'
    }

    COMPLEXITY = {
      1 => 'Simple',
      2 => 'Normal',
      3 => 'Hardcore'
    }
  end
end
