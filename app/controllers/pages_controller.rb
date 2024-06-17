class PagesController < ApplicationController
  def home
    @age = calculate_age
  end

  def cv
    @skills = Pages::Skill.new.my_skills
    @education = Pages::Education.new.my_education
    @experiences = Pages::Experience.new.my_experiences
    @languages = Pages::Language.new.my_languages
    @hobbies = Pages::Hobby.new.my_hobbies
  end

  def philosophy
    @conception = Pages::Step.new.conception_steps
    @development = Pages::Step.new.development_steps
    @maintenance = Pages::Step.new.maintenance_steps
  end

  def projects
  end

  def contact
  end

  def uikit
  end

  def featureflags
  end

  private

  def calculate_age
    ((Time.now - Time.new(1991, 7, 20))/31557600).floor
  end
end
