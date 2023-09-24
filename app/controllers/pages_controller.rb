class PagesController < ApplicationController
  def home
  end

  def cv
  end

  def contact
  end

  def philosophy
  end

  def projects
  end

  def cosmonaut
    respond_to do |format|
      format.html { render 'pages/projects/games/cosmonaut' }
    end
  end
end
