require 'rails_helper'

RSpec.describe "BusinessOwners", :type => :request do
  describe "GET /business_owners" do
    it "works! (now write some real specs)" do
      get business_owners_path
      expect(response.status).to be(200)
    end
  end
end
