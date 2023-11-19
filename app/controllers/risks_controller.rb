class RisksController < ApplicationController
  def new
  end

  def create
    @risk = RiskGame::Risk.create
    redirect_to risk_path(@risk)
  end

  def show
    @risk = Risk.find(params[:id])
  end
end
