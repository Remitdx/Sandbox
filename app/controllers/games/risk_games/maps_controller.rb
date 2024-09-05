module Games
  module RiskGames
    class MapsController < ApplicationController
      before_action :destroy_previous_map, only: [ :create ]

      def create
        @map = Games::RiskGames::Map.new(map_params)
        @map.roll_dimensions
        Games::RiskGames::Map.transaction do
          flash[:notice] = "New map generated !" if @map.save!
          @map.generate_tiles
        rescue ActiveRecord::StandardError
        end
        redirect_to edit_games_risk_games_risk_path(map_params[:risk_id])
      end

      private

      def map_params
        params.require(:games_risk_games_map).permit(:size, :risk_id)
      end

      def destroy_previous_map
        previous_map = Games::RiskGames::Map.where(risk_id: map_params[:risk_id])
        previous_map.destroy_all if previous_map.present?
      end
    end
  end
end
