module Games
  class Dikkenek < ApplicationRecord
    serialize :quotes, type: Array
    serialize :answers, type: Array

    validates :pseudo, :quotes, :difficulty, :gameover, presence: true
    validates :gameover, inclusion: { in: 0..2 }
    validates :good_answers, inclusion: { in: 0..10 }, allow_nil: true
    validates :difficulty, numericality: { less_than_or_equal_to: 5 }
    validates :accuracy, numericality: { less_than_or_equal_to: 100 }, allow_nil: true

    def end_game(params)
      self.format_answers(params)
      self.compute_score
      self.average_accuracy
      self.how_many_good_answers
    end

    def average_players_accuracy
      extracted_accuracies = Games::Dikkenek.pluck(:accuracy).reject {|e| e.nil? }
      return 0 if extracted_accuracies.empty?
      (extracted_accuracies.sum / extracted_accuracies.size).round(1)
    end

    def average_players_timer
      extracted_timers = Games::Dikkenek.pluck(:answers).reject {|e| e.empty? }.map {|e| e.last[:delay]}
      (extracted_timers.sum / (extracted_timers.size * 1000.00)).round(2)
    end

    def average_difficulty
      return self if quotes.empty?

      self.difficulty = (quotes.map { |quote| quote[:difficulty] }).sum / 10.0
      self
    end

    def pick_10_quotes
      self.quotes = Games::Dikkeneks::Data::QUOTES.shuffle.first(10)
      self
    end

    private

    def average_accuracy
      return self if answers.empty? || quotes.empty?

      accuracy = 0.0
      for i in 0..9 do
        accuracy += (quotes[i][:scene].to_i - answers[i][:scene].to_i).abs
      end
      self.accuracy = ((608 - (accuracy / 10)) / 6.08).round(1)
      self
    end

    def compute_score
      score = 0
      for i in 0..9
        if self.quotes[i][:author] == self.answers[i][:author]
          gap = (self.quotes[i][:scene].to_i - self.answers[i][:scene].to_i).abs
          score += (608 - gap) * (1 + self.quotes[i][:difficulty] / 10)
        end
      end
      self.score = score * 60000/self.answers.last[:delay]
      self
    end

    def format_answers(params)
      return self unless self.gameover == 2

      answers = []
      for i in 1..10
        answers.push({ author: params[:"characters-#{i}"], scene: params[:"scene-#{i}"] })
      end
      self.answers = answers.push({ delay: params[:submit_at].to_i - params[:start_at].to_i })
      self
    end

    def how_many_good_answers
      return self if answers.empty? || quotes.empty?

      good = 0
      for i in 0..9 do
        good += 1 if quotes[i][:author] == answers[i][:author]
      end
      self.good_answers = good
      self
    end
  end
end
