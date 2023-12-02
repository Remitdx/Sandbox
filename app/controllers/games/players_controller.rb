class Games::PlayersController < ApplicationController
  def create
    @player = Games::Player.new(player_params)
    @player.pseudo.capitalize!
    @player.save ? flash[:notice] = "A new player enter the game !" : flash[:alert] = @player.errors[:pseudo].first
    redirect_to edit_games_risk_path(player_params[:risk_id])
  end

  def destroy
    Games::Player.find(params[:id]).destroy
    redirect_to edit_games_risk_path(player_params[:risk_id])
  end

  private

  def player_params
    params.require(:games_player).permit(:pseudo, :risk_id)
  end
end
