require 'rails_helper'

RSpec.describe "Graduates", type: :request do
  describe "GET /graduates" do
    it "works! (now write some real specs)" do
      get graduates_path
      expect(response).to have_http_status(200)
    end
  end
end
