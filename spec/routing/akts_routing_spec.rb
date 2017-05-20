require "rails_helper"

RSpec.describe AktsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/akts").to route_to("akts#index")
    end

    it "routes to #new" do
      expect(:get => "/akts/new").to route_to("akts#new")
    end

    it "routes to #show" do
      expect(:get => "/akts/1").to route_to("akts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/akts/1/edit").to route_to("akts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/akts").to route_to("akts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/akts/1").to route_to("akts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/akts/1").to route_to("akts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/akts/1").to route_to("akts#destroy", :id => "1")
    end

  end
end
