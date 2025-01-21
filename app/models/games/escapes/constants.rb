module Games
  module Escapes
    class Constants
      include ActiveModel::Model

      TEXTS = {
        0 => I18n.t("escapegame.intro"),
        10 => I18n.t("escapegame.shiny"),
        11 => I18n.t("escapegame.bunker.one"),
        20 => I18n.t("escapegame.bunker.two"),
        21 => I18n.t("escapegame.pantry.in"),
        22 => I18n.t("escapegame.leisure.in"),
        23 => I18n.t("escapegame.tech.in"),
        # 24 => I18n.t("escapegame.hangar.one"),
        # 25 => I18n.t("escapegame.hangar.one"),
        30 => I18n.t("escapegame.pantry.out"),
        40 => I18n.t("escapegame.leisure.out"),
        50 => I18n.t("escapegame.tech.out")
      }

      COMPUTERS = {
        0 => "",
        20 => I18n.t("escapegame.computer.hello") # Array to display multiple screens ?
        # 31 => I18n.t("escapegame.computer"),
        # 41 => I18n.t("escapegame.computer"),
        # 51 => I18n.t("escapegame.computer")
      }

      EVENTS = {
        10 => { map: Games::Escapes::Maps::MAPS["intro"], character_x: 6, character_y: 5 }, # see shiny thing
        11 => { map: Games::Escapes::Maps::MAPS["intro"], character_x: 11, character_y: 2 }, # fall into bunker
        20 => { map: Games::Escapes::Maps::MAPS["bunker"], character_x: 11, character_y: 8 }, # meet computer
        21 => { map: Games::Escapes::Maps::MAPS["bunker"], character_x: 1, character_y: 12 }, # enter pantry room
        22 => { map: Games::Escapes::Maps::MAPS["bunker"], character_x: 15, character_y: 12 }, # enter leisure room
        23 => { map: Games::Escapes::Maps::MAPS["bunker"], character_x: 3, character_y: 0 }, # enter tech room
        # 24 => { map: Games::Escapes::Maps::MAPS["bunker"], character_x: 18, character_y: 2 }, # get out by hangar
        # 25 => { map: Games::Escapes::Maps::MAPS["bunker"], character_x: 18, character_y: 2 }, # get out by hangar
        30 => { map: Games::Escapes::Maps::MAPS["pantry"], character_x: 8, character_y: 0 }, # exit pantry room
        40 => { map: Games::Escapes::Maps::MAPS["leisure"], character_x: 1, character_y: 0 }, # exit leisure room
        50 => { map: Games::Escapes::Maps::MAPS["tech"], character_x: 5, character_y: 7 } # exit tech room
      }

      RESPONSES = {
        0 => { map: Games::Escapes::Maps::MAPS["intro"], character_x: 1, character_y: 1, computer: 0, text: 0, turbo_computer: false, turbo_map: false, turbo_text: false },
        10 => { character_x: 6, character_y: 5, computer: 0, text: 10, turbo_computer: false, turbo_map: false, turbo_text: true },
        11 => { map: Games::Escapes::Maps::MAPS["bunker"], character_x: 6, character_y: 9, computer: 0, text: 11, turbo_computer: false, turbo_map: true, turbo_text: true },
        20 => { character_x: 11, character_y: 8, computer: 20, text: 20, turbo_computer: true, turbo_map: false, turbo_text: true },
        21 => { map: Games::Escapes::Maps::MAPS["pantry"], character_x: 8, character_y: 1, computer: 0, text: 21, turbo_computer: true, turbo_map: true, turbo_text: true },
        22 => { map: Games::Escapes::Maps::MAPS["leisure"], character_x: 1, character_y: 1, computer: 0, text: 22, turbo_computer: true, turbo_map: true, turbo_text: true },
        23 => { map: Games::Escapes::Maps::MAPS["tech"], character_x: 5, character_y: 6, computer: 0, text: 23, turbo_computer: true, turbo_map: true, turbo_text: true },
        # 24 => { map: Games::Escapes::Maps::MAPS["hangar"], character_x: 6, character_y: 9, text: 24, turbo_computer: true, turbo_map: true, turbo_text: true },
        # 25 => { map: Games::Escapes::Maps::MAPS["hangar"], character_x: 6, character_y: 9, text: 25, turbo_computer: true, turbo_map: true, turbo_text: true },
        30 => { map: Games::Escapes::Maps::MAPS["bunker"], character_x: 1, character_y: 11, computer: 0, text: 30, turbo_computer: true, turbo_map: true, turbo_text: true },
        40 => { map: Games::Escapes::Maps::MAPS["bunker"], character_x: 15, character_y: 11, computer: 0, text: 40, turbo_computer: true, turbo_map: true, turbo_text: true },
        50 => { map: Games::Escapes::Maps::MAPS["bunker"], character_x: 3, character_y: 1, computer: 0, text: 50, turbo_computer: true, turbo_map: true, turbo_text: true }
      }

    end
  end
end
