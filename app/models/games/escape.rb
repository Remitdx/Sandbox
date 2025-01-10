module Games
  class Escape < ApplicationRecord
    serialize :parameters, type: Array

    SPRITE = {
        0 => "grass",
        1 => "path",
        2 => "path out"
      }

    def pick_game_parameters
      # TODO
      code = rand(1000..9999)
    end

    def generate_bunker_map
    end

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

    # if screen téléphone --> fuck off sorry !

    # un enfant qui fait de l'urbex et tombe.
    # flèches en surbriance, 1 seule direction possible, avance automatique pour tomber
    # dans un bunker sous terrain de Régis (en: Brian).

    # musique desactivable

    # piece vue de dessus pokemon style, sprites pour le decor le perso bouge de sprite en sprite avec les flèches.

    # 1. chrono démarre, le générateur d'oxygène est HS. (tuto)

    # 2.

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

    def self.set_up_biome
      a = []
      3.times { a << "tree" }
      a << "cow"
      60.times { a << "" }
      2.times { a << "mushroom" }
      2.times { a << "plants" }
      return a
    end
  end
end
