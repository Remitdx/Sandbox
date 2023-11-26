class Games::RisksController < ApplicationController
  def create
    @risk = Games::Risk.create
    redirect_to edit_games_risk_path(@risk)
  end

  def edit
    @risk = Games::Risk.find_by(id: params[:id])
    @players = Games::Player.where(risk_id: params[:id])
    @map = Games::Map.where(risk_id: params[:id]).first
    @empty_player = Games::Player.new
    @empty_map = Games::Map.new
  end

  def update
    # TODO: save games options
    redirect_to games_risk_path(params[:id])
  end

  def show
    @risk = Games::Risk.find(params[:id])
    @map = Games::Map.find_by(risk_id: params[:id])
  end
end
