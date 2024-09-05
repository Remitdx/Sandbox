module Games
  module RiskGames
    class RisksController < ApplicationController
      before_action :prepare_map, only: [ :edit, :show ]

      def create
        @risk = Games::RiskGames::Risk.create
        redirect_to edit_games_risk_games_risk_path(@risk)
      end

      def edit
        @risk = Games::RiskGames::Risk.find_by(id: params[:id])
        @players = Games::RiskGames::Player.where(risk_id: params[:id])
        @empty_player = Games::RiskGames::Player.new
        @empty_map = Games::RiskGames::Map.new
      end

      def update
        # TODO: save games options
        # TODO: risk.valid?
        redirect_to games_risk_games_risk_path(params[:id])
      end

      def show
        @risk = Games::RiskGames::Risk.find(params[:id])
      end

      private

      def prepare_map
        map = Games::RiskGames::Map.find_by(risk_id: params[:id])
        return nil unless map.present?

        @map = []
        for i in 1..map.lines do
          @map << map.tiles.select { |tile| tile.y == i }
        end
      end
    end
  end
end
