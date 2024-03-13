module Games
  extend ActiveSupport::Concern

  included do
  end

  class_methods do
    def reset_scores
      [0, 0, 0, 0, 'Please roll dices']
    end
  end
end
