require 'rails_helper'

RSpec.describe "Business::Auctions", :type => :request do
  describe "GET /business_auctions" do
    it "works! (now write some real specs)" do
      get business_auctions_path
      expect(response.status).to be(200)
    end
  end
end
