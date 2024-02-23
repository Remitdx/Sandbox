module Games
  module RiskGames
    class PlayersController < ApplicationController
      def create
        @player = Games::RiskGames::Player.new(player_params)
        @player.pseudo.capitalize!
        @player.save ? flash[:notice] = "A new player enter the game !" : flash[:alert] = @player.errors[:pseudo].first
        redirect_to edit_games_risk_games_risk_path(player_params[:risk_id])
      end

      def destroy
        Games::RiskGames::Player.find(params[:id]).destroy
        redirect_to edit_games_risk_games_risk_path(player_params[:risk_id])
      end

      private

      def player_params
        params.require(:games_risk_games_player).permit(:pseudo, :risk_id)
      end
    end
  end
end
