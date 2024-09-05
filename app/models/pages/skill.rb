module Pages
  class Skill
    include ActiveModel::Model

    def initialize
    end

    def my_skills
      [ back, front, devops, soft, collaboration, management ]
    end

    private

    def back
      {
        "title" => I18n.t("skills.back"),
        "Ruby" => 8,
        "Rails" => 9,
        "ActiveRecord" => 7,
        "Rspec" => 7,
        "SQL" => 5,
        "Python" => 4,
        "C++" => 2
      }
    end

    def front
      {
        "title" => I18n.t("skills.front"),
        "HTML" => 9,
        "CSS" => 8,
        "Scss" => 7,
        "Bootstrap" => 8,
        "Tailwind" => 5,
        "JavaScript" => 6,
        "Hotwired" => 7,
        "React" => 2,
        "JQuery" => 5
      }
    end

    def devops
      {
        "title" => I18n.t("skills.devops"),
        "Gitlab CI" => 4,
        "Docker" => 2,
        "Kubernetes" => 1,
        "Heroku" => 7,
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
        I18n.t("skills.curious") => 6
      }
    end

    def collaboration
      {
        "title" => I18n.t("skills.collaboration"),
        "Git" => 6,
        "Gitlab / Github" => 8,
        "Jira" => 5,
        "Slack" => 8,
        "Outlook" => 6,
        "Discord" => 7
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
