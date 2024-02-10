class PagesController < ApplicationController
  def home
    @age = calculate_age
  end

  def cv
    @skills = Skill.new.my_skills
    @education = Education.new.my_education
    @experiences = Experience.new.my_experiences
    @languages = Language.new.my_languages
    @hobbies = Hobby.new.my_hobbies
  end

  def philosophy
    @conception = Step.new.conception_steps
    @development = Step.new.development_steps
    @maintenance = Step.new.maintenance_steps
  end

  def projects
  end

  def contact
  end

  def uikit
  end

  private

  def calculate_age
    ((Time.now - Time.new(1991, 7, 20))/31557600).floor
  end
end
