module Pages
  class Education
    include ActiveModel::Model

    def initialize
    end

    def my_education
      {
        1 => {
              "start" => Date.new(2024),
              "title" => I18n.t("education.opquast")
              },
        2 => {
              "start" => Date.new(2021),
              "title" => I18n.t("education.wagon")
              },
        3 => {
              "start" => Date.new(2014),
              "title" => I18n.t("education.hei")
              },
        4 => {
              "start" => Date.new(2009),
              "title" => I18n.t("education.bac")
              }
      }
    end
  end
end
