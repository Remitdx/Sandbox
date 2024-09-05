module Pages
  class Hobby
    include ActiveModel::Model

    def initialize
    end

    def my_hobbies
      {
        1 => [ I18n.t("hobby.roadtrip.title"), I18n.t("hobby.roadtrip.description") ],
        2 => [ I18n.t("hobby.moutain.title"), I18n.t("hobby.moutain.description") ],
        3 => [ I18n.t("hobby.trail.title"), I18n.t("hobby.trail.description") ],
        4 => [ I18n.t("hobby.politic.title"), I18n.t("hobby.politic.description") ],
        5 => [ I18n.t("hobby.videogames.title"), I18n.t("hobby.videogames.description") ],
        6 => [ I18n.t("hobby.ecology.title"), I18n.t("hobby.ecology.description") ],
        7 => [ I18n.t("hobby.sports.title"), I18n.t("hobby.sports.description") ],
        8 => [ I18n.t("hobby.volonteering.title"), I18n.t("hobby.volonteering.description") ]
      }
    end
  end
end
