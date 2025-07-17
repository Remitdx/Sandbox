module Pages
  class Skill
    include ActiveModel::Model

    def initialize
    end

    def my_skills
      [ back, front, devops, soft, management ]
    end

    private

    def back
      {
        "title" => I18n.t("skills.back"),
        "Ruby" => 8,
        "Rails" => 9,
        "Background jobs" => 5,
        "Rspec" => 7,
        "SQL" => 5,
        "Python" => 4,
        "C++" => 3
      }
    end

    def front
      {
        "title" => I18n.t("skills.front"),
        "HTML" => 9,
        "CSS" => 8,
        "Bootstrap" => 8,
        "Tailwind" => 5,
        "JavaScript" => 7,
        "Hotwire/Turbo/Stimulus" => 9,
        "React" => 6,
        "JQuery" => 5
      }
    end

    def devops
      {
        "title" => I18n.t("skills.devops"),
        "CI/CD" => 5,
        "Docker" => 3,
        "Kubernetes" => 1,
        "Heroku" => 7,
        "Git/Github" => 7,
        "Jenkins" => 1,
        "Sentry" => 4
      }
    end

    def soft
      {
        "title" => I18n.t("skills.soft"),
        I18n.t("skills.afterwork") => 9,
        I18n.t("skills.critical") => 8,
        I18n.t("skills.problem") => 9,
        I18n.t("skills.adapt") => 7,
        I18n.t("skills.creative") => 5,
        I18n.t("skills.curious") => 7
      }
    end

    def management
      {
        "title" => I18n.t("skills.management"),
        I18n.t("skills.project") => 8,
        I18n.t("skills.time") => 9,
        I18n.t("skills.team") => 6,
        I18n.t("skills.communication") => 8,
        I18n.t("skills.leader") => 7
      }
    end
  end
end
