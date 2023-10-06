class PagesController < ApplicationController
  def home
  end

  def skills
    @skills = [back, front, devops, soft, collaboration]
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

  private

  def back
    {
      'title' => 'skills.back',
      'Ruby' => 7,
      'Rails' => 8,
      'ActiveRecord' => 5,
      'Rspec' => 5,
      'SQL' => 4,
      'Python' => 3,
      'C++' => 2
    }
  end

  def front
    {
      'title' => 'skills.front',
      'HTML' => 8,
      'CSS' => 6,
      'Scss' => 5,
      'Javascript' => 5,
      'Hotwire/Stimulus' => 6,
      'JQuery' => 4,
      'React' => 2
    }
  end

  def devops
    {
      'title' => 'skills.devops',
      'Gitlab CI' => 3,
      'Docker' => 1,
      'Kubernetes' => 1,
      'Heroku' => 5,
      'Jenkins' => 1,
      'Sentry' => 4
    }
  end

  def soft
    {
      'title' => 'skills.soft'
    }
  end

  def collaboration
    {
      'title' => 'skills.collaboration',
      'Gitlab / Github' => 8,
      'Jira' => 4,
      'Slack' => 6,
      'Outlook' => 6,
      'Discord' => 5
    }
  end
end
