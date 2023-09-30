class PagesController < ApplicationController
  def home
  end

  def skills
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
