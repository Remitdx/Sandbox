module Games
  class Dikkenek < ApplicationRecord
    serialize :quotes, Array
    serialize :answers, Array

    validates :pseudo, presence: true
    validates :gameover, presence: true, inclusion: { in: 0..2 }
  end
end
