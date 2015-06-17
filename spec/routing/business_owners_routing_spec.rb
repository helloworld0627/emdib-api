require "rails_helper"

RSpec.describe BusinessOwnersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/business_owners").to route_to("business_owners#index")
    end

    it "routes to #new" do
      expect(:get => "/business_owners/new").to route_to("business_owners#new")
    end

    it "routes to #show" do
      expect(:get => "/business_owners/1").to route_to("business_owners#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/business_owners/1/edit").to route_to("business_owners#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/business_owners").to route_to("business_owners#create")
    end

    it "routes to #update" do
      expect(:put => "/business_owners/1").to route_to("business_owners#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/business_owners/1").to route_to("business_owners#destroy", :id => "1")
    end

  end
end
