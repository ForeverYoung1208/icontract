require "rails_helper"

RSpec.describe ReminderTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/reminder_types").to route_to("reminder_types#index")
    end

    it "routes to #new" do
      expect(:get => "/reminder_types/new").to route_to("reminder_types#new")
    end

    it "routes to #show" do
      expect(:get => "/reminder_types/1").to route_to("reminder_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/reminder_types/1/edit").to route_to("reminder_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/reminder_types").to route_to("reminder_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/reminder_types/1").to route_to("reminder_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/reminder_types/1").to route_to("reminder_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/reminder_types/1").to route_to("reminder_types#destroy", :id => "1")
    end

  end
end
