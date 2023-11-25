module Games
  class Player < ApplicationRecord
    belongs_to :risk

    validates :pseudo,
              presence: true,
              uniqueness: { scope: :risk_id, message: "Pseudo déja utilisé dans la partie" },
              format: { with: /\A\w{1,20}\z/, message: "1 à 20 charactères alphanumériques" }
  end
end
