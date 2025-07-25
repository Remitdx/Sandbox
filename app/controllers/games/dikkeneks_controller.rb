module Games
  class DikkeneksController < ApplicationController
    skip_analytics only: [ :show, :update ]
    allow_unauthenticated_access

    def index
      @dikkenek = Games::Dikkenek.new
      @podium = Games::Dikkenek.where.not(score: nil).order(score: :desc).first(3)
      @last_played = Games::Dikkenek.where.not(score: nil).last(3)
    end

    def create
      @podium = Games::Dikkenek.where.not(score: nil).order(score: :desc).first(3)
      @last_played = Games::Dikkenek.where.not(score: nil).last(3)
      @dikkenek = Games::Dikkenek.new(pseudo: dikkenek_params[:pseudo].capitalize, gameover: 0)
      @dikkenek.pick_10_quotes
      @dikkenek.average_difficulty
      if @dikkenek.save
        redirect_to games_dikkenek_path(@dikkenek)
      else
        render "games/dikkeneks/index", status: :unprocessable_entity
      end
    end

    def show
      @characters = Games::Dikkeneks::Data::CHARACTERS.sort
      @dikkenek = Games::Dikkenek.find(params[:id])
      @average_players_accuracy = @dikkenek.average_players_accuracy
      @average_players_timer = @dikkenek.average_players_timer
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
