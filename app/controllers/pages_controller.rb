class PagesController < ApplicationController
  def home
  end

  def skills
    @skills = [back, front, devops, soft, collaboration, management]
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
      'Punctuality' => 9,
      'Afterwork partner' => 9,
      'Leadership' => 7
    }
  end

  def collaboration
    {
      'title' => 'skills.collaboration',
      'Git' => 6,
      'Gitlab / Github' => 8,
      'Jira' => 5,
      'Slack' => 8,
      'Outlook' => 7,
      'Discord' => 7
    }
  end

  def management
    {
      'title' => 'skills.management',
      'Project management' => 8,
      'Team management' => 6,
      'Non-violent communication' => 9
    }
  end
end
