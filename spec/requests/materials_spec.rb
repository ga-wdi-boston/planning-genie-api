require 'rails_helper'

RSpec.describe "Materials", type: :request do
  describe "GET /materials" do
    it "works! (now write some real specs)" do
      get materials_path
      expect(response).to have_http_status(200)
    end
  end
end
