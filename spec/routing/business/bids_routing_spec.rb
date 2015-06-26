require "rails_helper"

RSpec.describe Business::BidsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/business/bids").to route_to("business/bids#index")
    end

    it "routes to #new" do
      expect(:get => "/business/bids/new").to route_to("business/bids#new")
    end

    it "routes to #show" do
      expect(:get => "/business/bids/1").to route_to("business/bids#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/business/bids/1/edit").to route_to("business/bids#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/business/bids").to route_to("business/bids#create")
    end

    it "routes to #update" do
      expect(:put => "/business/bids/1").to route_to("business/bids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/business/bids/1").to route_to("business/bids#destroy", :id => "1")
    end

  end
end
