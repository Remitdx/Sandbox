module Games
  module Escapes
    class Constants
      include ActiveModel::Model

    TASKS = [ "computer",  "ventilation", "food", "water" ]

    THREATS = [ "Chemical war", "ET", "Meteorites" ]

    TEXTS = [
      I18n.t("escapegame.intro"),
      I18n.t("escapegame.shiny"),
      I18n.t("escapegame.bunker.one"),
      I18n.t("escapegame.bunker.two")

    ]
    end
  end
end
