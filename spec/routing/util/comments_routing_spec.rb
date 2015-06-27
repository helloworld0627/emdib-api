require "rails_helper"

RSpec.describe Util::CommentsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/util/comments").to route_to("util/comments#index")
    end

    it "routes to #new" do
      expect(:get => "/util/comments/new").to route_to("util/comments#new")
    end

    it "routes to #show" do
      expect(:get => "/util/comments/1").to route_to("util/comments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/util/comments/1/edit").to route_to("util/comments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/util/comments").to route_to("util/comments#create")
    end

    it "routes to #update" do
      expect(:put => "/util/comments/1").to route_to("util/comments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/util/comments/1").to route_to("util/comments#destroy", :id => "1")
    end

  end
end
