class PagesController < ApplicationController
  def home
    @age = calculate_age
  end

  def cv
    @skills = Skill.new.my_skills
    @education = Education.new.my_education
    @languages = Language.new.my_languages
  end

  def philosophy
  end

  def projects
  end

  def contact
  end

  def cosmonaut
    respond_to do |format|
      format.html { render 'pages/projects/games/cosmonaut' }
    end
  end

  private

  def calculate_age
    ((Time.now - Time.new(1991, 7, 20))/31557600).floor
  end
end
