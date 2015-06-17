require 'rails_helper'

RSpec.describe "Auctions", :type => :request do
  describe "GET /auctions" do
    it "works! (now write some real specs)" do
      get auctions_path
      expect(response.status).to be(200)
    end
  end
end
