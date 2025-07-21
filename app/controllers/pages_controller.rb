class PagesController < ApplicationController
  skip_analytics only: [ :admin ]
  allow_unauthenticated_access only: [ :home, :cv, :philosophy, :projects, :uikit, :legal ]

  def home
    @age = calculate_age
  end

  def cv
    @skills = Pages::Skill.new.my_skills
    @education = Pages::Education.new.my_education
    @experiences = Pages::Experience.new.my_experiences
    @hobbies = Pages::Hobby.new.my_hobbies
  end

  def philosophy
    @conception = Pages::Step.new.conception_steps
    @development = Pages::Step.new.development_steps
    @maintenance = Pages::Step.new.maintenance_steps
  end

  def projects
    @projects_pro = Pages::Project.new.projects_pro
    @project_placeholder = Pages::Project.new.project_placeholder
  end

  def uikit
    @palmares = {
      1 => { "start" => Date.new(2024),
              "title" => "Supercopa de España, Liga, Supercopa de Europa, Mundiales de clubes, Champion's league"
      },
      2 => { "start" => Date.new(2023),
              "title" => "Copa del rey, "
      },
      3 => { "start" => Date.new(2022),
              "title" => "Supercopa de España, Liga, Supercopa de Europa, Mundiales de clubes, Champion's league"
      }
    }
    @lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  end

  def legal
  end

  def admin
    @analytics = Analytic.order(created_at: :desc).limit(3)
    @contacts = Contact.where(new: true).order(created_at: :desc).limit(10)
  end

  private

  def calculate_age
    ((Time.now - Time.new(1991, 7, 20))/31557600).floor
  end
end
