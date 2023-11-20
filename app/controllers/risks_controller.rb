class RisksController < ApplicationController
  def new
    @players = RiskGame::Player.where(risk_id: params[:id])

  end

  def create
    @risk = RiskGame::Risk.create
    redirect_to risk_path(@risk)
  end

  def show
    @risk = RiskGame::Risk.find(params[:id])
  end
end
