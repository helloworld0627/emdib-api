require 'rails_helper'

RSpec.describe "Business::Bids", :type => :request do
  describe "GET /business_bids" do
    it "works! (now write some real specs)" do
      get business_bids_path
      expect(response.status).to be(200)
    end
  end
end
