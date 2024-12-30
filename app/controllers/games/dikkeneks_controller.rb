module Games
  class DikkeneksController < ApplicationController
    def index
      @dikkenek = Games::Dikkenek.new
      @podium = Games::Dikkenek.where.not(score: nil).order(score: :desc).first(3)
      @last_played = Games::Dikkenek.where.not(score: nil).last(3)
    end

    def create
      @dikkenek = Games::Dikkenek.new(pseudo: dikkenek_params[:pseudo].capitalize, gameover: 0)
      @dikkenek.pick_10_quotes
      @dikkenek.average_difficulty
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
      @dikkenek.end_game(params) if @dikkenek.gameover == 2
      @dikkenek.save
      redirect_to games_dikkenek_path(@dikkenek)
    end

    private

    def dikkenek_params
      params.require(:games_dikkenek).permit(:pseudo, :answer)
    end
  end
end
