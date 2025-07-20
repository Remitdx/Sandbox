require 'rails_helper'

RSpec.describe "Errors", type: :request do
  describe "GET /internal_error" do
    it "returns http success" do
      get "/errors/internal_error"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /not_found" do
    it "returns http success" do
      get "/errors/not_found"
      expect(response).to have_http_status(:success)
    end
  end

end
