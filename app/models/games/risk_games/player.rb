module Games
  module RiskGames
    class Player < ApplicationRecord
      has_many :units, dependent: :destroy
      belongs_to :risk

      validates :pseudo,
                  presence: true,
                  uniqueness: { scope: :risk_id, message: 'Pseudo already taken' },
                  format: { with: /\A\S{2,16}\z/, message: 'Length from 2 to 16' }
    end
  end
end
