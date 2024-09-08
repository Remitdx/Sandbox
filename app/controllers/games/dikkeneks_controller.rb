module Games
  class DikkeneksController < ApplicationController
    require "json"
    def index
    end

    def create
      @dikkenek = Games::Dikkenek::Dikkenek.create(pseudo: "Jeanluc", gameover: 1, quotes: pick_10_quotes)
      redirect_to games_dikkenek_path(@dikkenek)
    end

    def show
      @characters = Games::Dikkenek::Data::CHARACTERS
      @dikkenek = Games::Dikkenek::Dikkenek.find(params[:id])
    end

    private

    def pick_10_quotes
      Games::Dikkenek::Data::QUOTES.shuffle.first(10)
    end
  end
end
