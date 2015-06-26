require "rails_helper"

RSpec.describe Business::AuctionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/business/auctions").to route_to("business/auctions#index")
    end

    it "routes to #new" do
      expect(:get => "/business/auctions/new").to route_to("business/auctions#new")
    end

    it "routes to #show" do
      expect(:get => "/business/auctions/1").to route_to("business/auctions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/business/auctions/1/edit").to route_to("business/auctions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/business/auctions").to route_to("business/auctions#create")
    end

    it "routes to #update" do
      expect(:put => "/business/auctions/1").to route_to("business/auctions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/business/auctions/1").to route_to("business/auctions#destroy", :id => "1")
    end

  end
end
