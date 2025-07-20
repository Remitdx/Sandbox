module Utilities
  class TournamentsController < ApplicationController
    skip_analytics only: [:show, :update]
    allow_unauthenticated_access

    def index
    end

    def create
    end

    def show
    end

    def update
    end

    private
  end
end
