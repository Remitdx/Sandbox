class PagesController < ApplicationController
  def home
  end

  def skills
    @backskills = {
      'Ruby' => 7,
      'Rails' => 8,
      'ActiveRecord' => 5,
      'SQL' => 4,
      'Python' => 3,
      'C++' => 1
    }
    @frontskills = {
      'HTML' => 9,
      'CSS' => 7,
      'Scss' => 5,
      'Javascript' => 5,
      'Hotwire/Stimulus' => 6,
      'JQuery' => 4,
      'React' => 2
    }
  end

  def philosophy
  end

  def projects
  end

  def resources
  end

  def contact
  end

  def cosmonaut
    respond_to do |format|
      format.html { render 'pages/projects/games/cosmonaut' }
    end
  end
end
