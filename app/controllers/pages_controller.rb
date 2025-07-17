class PagesController < ApplicationController
  before_action :increment_visit_counter, only: [:home, :cv, :philosophy, :projects, :uikit, :contact]

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

  def contact
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

  def featureflags
  end

  def analytics
    @analytics = Analytic.last(3)
  end

  private

  def increment_visit_counter
    return nil if handle_session.nil?
    current_analytic = last_or_new_analytics

    increment(current_analytic, action_name)
  end

  def calculate_age
    ((Time.now - Time.new(1991, 7, 20))/31557600).floor
  end

  def handle_session
    page_identifier = "#{controller_name}_#{action_name}"
    return nil if session["visited_#{page_identifier}"]
    session["visited_#{page_identifier}"] = true
  end

  def last_or_new_analytics
    analytics_this_month? ? Analytic.last : Analytic.create(home: 0, cv: 0, philosophy: 0, projects: 0, contact: 0, uikit: 0)
  end

  def analytics_this_month?
    return false if Analytic.count == 0
    Analytic.last.created_at.month == Time.current.month
  end

  def increment(analytic, action)
    analytic.increment!(action.to_sym)
  end
end
