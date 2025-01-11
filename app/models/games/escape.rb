module Games
  class Escape < ApplicationRecord
    require 'date'
    serialize :parameters, type: Hash

    SPRITE = {
      0 => "grass",
      1 => "path",
      2 => "path out",
      3 =>  "wall"
    }
    TASKS = ["computer",  "ventilation", "food", "water"]
    THREATS = ["Chemical war", "ET", "Meteorites"]

    def intro_map
      [
        [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 0, 0, 0 ],
        [ 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0 ],
        [ 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 ],
        [ 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0 ],
        [ 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0 ],
        [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
      ]
    end

    def set_game_parameters
      self.parameters = {
        code: generate_code,
        map: generate_bunker_map,
        start_time: DateTime.now,
        end_time: nil,
        threat: pick_threat,
        tasks: pick_tasks
      }
    end

    def self.set_up_biome
      a = []
      3.times { a << "tree" }
      a << "cow"
      60.times { a << "" }
      2.times { a << "mushroom" }
      2.times { a << "plants" }
      return a
    end

    private

    def pick_tasks
      TASKS.sample(4)
    end

    def pick_threat
      THREATS.sample
    end

    def generate_code
      code = []
      4.times { code << rand(1..9) }
      code
    end

    def generate_bunker_map
      [
        [ 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 ],
        [ 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 1, 1, 1, 3 ],
        [ 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 1, 1, 1, 3 ],
        [ 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 ]
      ]
    end


    # if screen téléphone --> fuck off sorry !

    # un enfant qui fait de l'urbex et tombe.
    # flèches en surbriance, 1 seule direction possible, avance automatique pour tomber
    # dans un bunker sous terrain de Régis (en: Brian).

    # musique desactivable

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
