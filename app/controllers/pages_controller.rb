class PagesController < ApplicationController
  def home
    @age = calculate_age
  end

  def cv
    @skills = [back, front, devops, soft, collaboration, management]
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

  def back
    {
      'title' => 'skills.back',
      'Ruby' => 8,
      'Rails' => 9,
      'ActiveRecord' => 7,
      'Rspec' => 7,
      'SQL' => 5,
      'Python' => 4,
      'C++' => 2
    }
  end

  def front
    {
      'title' => 'skills.front',
      'HTML' => 9,
      'CSS' => 8,
      'Scss' => 7,
      'Bootstrap' => 8,
      'Tailwind' => 5,
      'JavaScript' => 6,
      'Hotwired' => 7,
      'React' => 2,
      'JQuery' => 5
    }
  end

  def devops
    {
      'title' => 'skills.devops',
      'Gitlab CI' => 4,
      'Docker' => 2,
      'Kubernetes' => 1,
      'Heroku' => 7,
      'Jenkins' => 1,
      'Sentry' => 4
    }
  end

  def soft
    {
      'title' => 'skills.soft',
      'skills.afterwork' => 9,
      'skills.critical' => 8,
      'skills.problem' => 9,
      'skills.adapt' => 7,
      'skills.creative' => 5,
      'skills.curious' => 6
    }
  end

  def collaboration
    {
      'title' => 'skills.collaboration',
      'Git' => 6,
      'Gitlab / Github' => 8,
      'Jira' => 5,
      'Slack' => 8,
      'Outlook' => 6,
      'Discord' => 7
    }
  end

  def management
    {
      'title' => 'skills.management',
      'skills.project' => 8,
      'skills.time' => 9,
      'skills.team' => 6,
      'skills.communication' => 8,
      'skills.leader' => 7
    }
  end
end
