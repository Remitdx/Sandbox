module Games
  class Dikkenek < ApplicationRecord
    serialize :quotes, Array

    validates :pseudo, presence: true, format: { with: /\A\S{2,16}\z/, message: "Length from 2 to 16" }
    validates :gameover, presence: true, inclusion: { in: 0..2 }
  end
end