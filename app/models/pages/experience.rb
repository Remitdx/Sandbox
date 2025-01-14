module Pages
  class Experience
    include ActiveModel::Model

    def initialize
    end

    def my_experiences
      {
        5 => {
              "sector" => "IT",
              "start" => Date.new(2022, 1),
              "end" => Time.now,
              "company" => "Rémi Tondeux",
              "title" => I18n.t("workexp.fifth.title"),
              "description" => I18n.t("workexp.fifth.description"),
              "place" => I18n.t("workexp.fifth.place")
            },
        4 => {
              "sector" => "Construction",
              "start" => Date.new(2018, 3),
              "end" => Date.new(2019, 10),
              "company" => "Vaudoise aréna",
              "title" => I18n.t("workexp.fourth.title"),
              "description" => I18n.t("workexp.fourth.description"),
              "place" => I18n.t("workexp.fourth.place")
            },
        3 => {
              "sector" => "Construction",
              "start" => Date.new(2015, 9),
              "end" => Date.new(2017, 10),
              "company" => "Module-IT",
              "title" => I18n.t("workexp.third.title"),
              "description" => I18n.t("workexp.third.description"),
              "place" => I18n.t("workexp.third.place")
            },
        2 => {
              "sector" => "Construction",
              "start" => Date.new(2014, 1),
              "end" => Date.new(2014, 7),
              "company" => "Losinger-Marazzi",
              "title" => I18n.t("workexp.second.title"),
              "description" => I18n.t("workexp.second.description"),
              "place" => I18n.t("workexp.second.place")
            },
        1=> {
              "sector" => "Construction",
              "start" => Date.new(2013, 6),
              "end" => Date.new(2013, 12),
              "company" => "Bouygues Construction",
              "title" => I18n.t("workexp.first.title"),
              "description" => I18n.t("workexp.first.description"),
              "place" => I18n.t("workexp.first.place")
            }
      }
    end
  end
end
