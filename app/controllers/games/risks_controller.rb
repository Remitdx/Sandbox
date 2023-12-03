class Games::RisksController < ApplicationController
  before_action :prepare_map, only: [:edit, :show]

  def create
    @risk = Games::Risk.create
    redirect_to edit_games_risk_path(@risk)
  end

  def edit
    @risk = Games::Risk.find_by(id: params[:id])
    @players = Games::Player.where(risk_id: params[:id])
    @empty_player = Games::Player.new
    @empty_map = Games::Map.new
  end

  def update
    # TODO: save games options
    # TODO: risk.valid?
    redirect_to games_risk_path(params[:id])
  end

  def show
    @risk = Games::Risk.find(params[:id])
  end

  private

  def prepare_map
    map = Games::Map.find_by(risk_id: params[:id])
    return nil unless map.present?

    @map = []
    for i in 1..map.lines do
      @map << map.tiles.select { |tile| tile.y == i }
    end
  end
end
