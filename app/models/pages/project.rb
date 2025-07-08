module Pages
  class Project
    include ActiveModel::Model

    def initialize
    end

    def projects_pro
      [ centre_mormal, mon_projet_anah ]
    end

    def project_placeholder
      {
        "title" => I18n.t("placeholder.title"),
        "classes" => "project-placeholder",
        "description" => I18n.t("placeholder.description"),
        "testimonials" => [],
        "period" => Time.now.strftime("%Y"),
        "link" => ''
      }
    end

    private

    def centre_mormal
      {
        "title" => "Centre Mormal",
        "classes" => "cm",
        "description" => I18n.t("centremormal.description"),
        "testimonials" => [{quote: I18n.t("centremormal.testimonial"), author: I18n.t("centremormal.author")}],
        "period" => "2022",
        "link" => 'https://centremormal.fr/'
      }
    end

    def mon_projet_anah
      {
        "title" => "Mon Projet Anah",
        "classes" => "mpa",
        "description" => I18n.t("monprojetanah.description"),
        "testimonials" => [
          {quote: I18n.t("monprojetanah.testimonial1"), author: I18n.t("monprojetanah.author1")},
          {quote: I18n.t("monprojetanah.testimonial2"), author: I18n.t("monprojetanah.author2")},
          {quote: I18n.t("monprojetanah.testimonial3"), author: I18n.t("monprojetanah.author3")},
          {quote: I18n.t("monprojetanah.testimonial4"), author: I18n.t("monprojetanah.author4")},
          {quote: I18n.t("monprojetanah.testimonial5"), author: I18n.t("monprojetanah.author5")}
        ],
        "period" => "2023-2024",
        "link" => 'https://monprojet.anah.gouv.fr/'
      }
    end
  end
end
