module Games
  class Roll < ApplicationRecord
    has_many :roll_dices, dependent: :destroy
  end
end
