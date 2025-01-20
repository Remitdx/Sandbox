module Games
  module Escapes
    class Constants
      include ActiveModel::Model

      TEXTS = [
        I18n.t("escapegame.intro"),
        I18n.t("escapegame.shiny"),
        I18n.t("escapegame.bunker.one"),
        I18n.t("escapegame.bunker.two")

      ]

      EVENTS = {
        1 => { map: Games::Escapes::Maps::MAPS["intro"], character_x: 6, character_y: 5 },
        2 => { map: Games::Escapes::Maps::MAPS["intro"], character_x: 11, character_y: 2 }
      }

      RESPONSES = {
        0 => { map: Games::Escapes::Maps::MAPS["intro"], character_x: 1, character_y: 1, text: 0, turbo_computer: false, turbo_map: false, turbo_text: false },
        1 => { character_x: 6, character_y: 5, text: 1, turbo_computer: false, turbo_map: false, turbo_text: true },
        2 => { map: Games::Escapes::Maps::MAPS["bunker"], character_x: 6, character_y: 9, text: 2, turbo_computer: false, turbo_map: true, turbo_text: true }
      }

    end
  end
end
