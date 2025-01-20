module Games
  class Escape < ApplicationRecord
    require "date"
    serialize :parameters, type: Hash

    def set_game_parameters
      self.parameters = {
        code: generate_code,
        map_x: 18,
        map_y: 12,
        character_x: 6,
        character_y: 9,
        start_time: DateTime.now,
        end_time: nil,
        threat: pick_threat,
        tasks: pick_tasks
      }
    end

    private

    def pick_tasks
      Games::Escapes::Constants::TASKS.sample(4)
    end

    def pick_threat
      Games::Escapes::Constants::THREATS.sample
    end

    def generate_code
      code = []
      4.times { code << rand(1..9) }
      code
    end

    # css can handle 16 lines, 24 columns maximum for now.


    # if screen téléphone --> fuck off sorry !

    # un enfant qui fait de l'urbex et tombe.
    # flèches en surbriance, 1 seule direction possible, avance automatique pour tomber
    # dans un bunker sous terrain de Régis (en: Brian).

    # musique desactivable

    # transition sympa pour la chute vers le bunker

    # full hd : 1920 x 1080 pixels soit 60 colonnes pour 33.75 lignes

    # 1. chrono démarre, le générateur d'oxygène est HS.

    # prendre conscience de la menace exterieure.
    # la menace est tirée au sort parmis plusieurs : extraterrestres, météorites, guerre chimique,


    # 5-6 "mini jeux" dont 4 tirées au sort pour la rejouabilité.

    # create a card neon style to unlock a part. 4 buttons, pixel art space invaders

    # def create 4 digit code to end game. submit form with code.

    ### DB ###
    ## table escape
    # step, integer
    # score
    # parameters [time, threat, code, tasks, ...]
  end
end
