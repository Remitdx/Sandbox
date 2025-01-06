module Games
  class Dikkenek < ApplicationRecord
    serialize :quotes, type: Array
    serialize :answers, type: Array

    validates :pseudo, presence: true
    validates :gameover, presence: true, inclusion: { in: 0..2 }

    def end_game(params)
      self.format_answers(params)
      self.compute_score
      self.average_accuracy
      self.how_many_good_answers
    end

    def average_difficulty
      return nil if quotes.empty?

      self.difficulty = (quotes.map { |quote| quote[:difficulty] }).sum / 10.0
    end

    def pick_10_quotes
      self.quotes = Games::Dikkeneks::Data::QUOTES.shuffle.first(10)
    end

    private

    def average_accuracy
      return nil if answers.empty? || quotes.empty?

      accuracy = 0.0
      for i in 0..9 do
        accuracy += (quotes[i][:scene].to_i - answers[i][:scene].to_i).abs
      end
      self.accuracy = ((608 - (accuracy / 10)) / 6.08).round(1)
    end

    def compute_score
      score = 0
      for i in 0..9
        if self.quotes[i][:author] == self.answers[i][:author]
          gap = (self.quotes[i][:scene].to_i - self.answers[i][:scene].to_i).abs
          score += (608 - gap) * (1 + self.quotes[i][:difficulty] / 10)
        end
      end
      self.score = score * 40000/self.answers.last[:delay]
    end

    def format_answers(params)
      return nil unless self.gameover == 2

      answers = []
      for i in 1..10
        answers.push({ author: params[:"characters-#{i}"], scene: params[:"scene-#{i}"] })
      end
      self.answers = answers.push({ delay: params[:submit_at].to_i - params[:start_at].to_i })
    end

    def how_many_good_answers
      return nil if answers.empty? || quotes.empty?

      good = 0
      for i in 0..9 do
        good += 1 if quotes[i][:author] == answers[i][:author]
      end
      self.good_answers = good
    end
  end
end
