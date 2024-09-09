module Games
  class DikkeneksController < ApplicationController
    require "json"
    def index
      @dikkenek = Games::Dikkenek.new
    end

    def create
      @dikkenek = Games::Dikkenek.new(pseudo: dikkenek_params[:pseudo], gameover: 0, quotes: pick_10_quotes)
      if @dikkenek.save
        redirect_to games_dikkenek_path(@dikkenek)
      else
        render index:, status: :unprocessable_entity
      end
    end

    def show
      @characters = Games::Dikkeneks::Data::CHARACTERS
      @dikkenek = Games::Dikkenek.find(params[:id])
    end

    def update
      @dikkenek = Games::Dikkenek.find(params[:id])
      @dikkenek.gameover += 1
      # calcul du resultat if @dikkenek == 2
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
  end
end
