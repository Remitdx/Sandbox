module Games
  class DikkeneksController < ApplicationController
    def index
      @dikkenek = Games::Dikkenek.new
      @podium = Games::Dikkenek.where.not(score: nil).order(score: :desc).first(3)
      @last_played = Games::Dikkenek.where.not(score: nil).last(3).reverse
    end

    def create
      @dikkenek = Games::Dikkenek.new(pseudo: dikkenek_params[:pseudo], gameover: 0, quotes: pick_10_quotes)
      if @dikkenek.save
        redirect_to games_dikkenek_path(@dikkenek)
      else
        # render index:, status: :unprocessable_entity
      end
    end

    def show
      @characters = Games::Dikkeneks::Data::CHARACTERS.sort
      @dikkenek = Games::Dikkenek.find(params[:id])
    end

    def update
      @dikkenek = Games::Dikkenek.find(params[:id])
      @dikkenek.gameover += 1 unless @dikkenek.gameover == 2
      @dikkenek.answers = formated_answers if @dikkenek.gameover == 2
      @dikkenek.score = compute_score(@dikkenek) if @dikkenek.gameover == 2
      @dikkenek.save
      redirect_to games_dikkenek_path(@dikkenek)
    end

    private

    def pick_10_quotes
      Games::Dikkeneks::Data::QUOTES.shuffle.first(10)
    end

    def dikkenek_params
      params.require(:games_dikkenek).permit(:pseudo, :answer)
    end

    def compute_score(dikkenek)
      # return the computed score
      score = 0
      for i in 0..9
        if dikkenek.quotes[i][:author] == dikkenek.answers[i][:author]
          gap = (dikkenek.quotes[i][:scene].to_i - dikkenek.answers[i][:scene].to_i).abs
          score += (608 - gap) * (1 + dikkenek.quotes[i][:difficulty] / 10)
        end
      end
      score * 35000/dikkenek.answers.last[:delay]
    end

    def formated_answers
      # return the answer in a great format to save it later
      answers = []
      for i in 1..10
        answers.push({ author: params[:"characters-#{i}"], scene: params[:"scene-#{i}"] })
      end
      answers.push({ delay: params[:submit_at].to_i - params[:start_at].to_i })
      answers
    end
  end
end
