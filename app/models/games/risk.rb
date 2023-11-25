module Games
  class Risk < ApplicationRecord
    has_many :players, dependent: :destroy
  end
end
