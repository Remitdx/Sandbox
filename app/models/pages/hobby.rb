module Pages
  class Hobby
    include ActiveModel::Model

    def initialize
    end

    def my_hobbies
      {
        1 => I18n.t("hobby.roadtrip.title"),
        2 => I18n.t("hobby.trail.title"),
        3 => I18n.t("hobby.politic.title"),
        4 => I18n.t("hobby.videogames.title"),
        5 => I18n.t("hobby.ecology.title"),
        6 => I18n.t("hobby.volonteering.title")
      }
    end
  end
end
