require "rails_helper"

RSpec.describe GraduatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/graduates").to route_to("graduates#index")
    end

    it "routes to #new" do
      expect(:get => "/graduates/new").to route_to("graduates#new")
    end

    it "routes to #show" do
      expect(:get => "/graduates/1").to route_to("graduates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/graduates/1/edit").to route_to("graduates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/graduates").to route_to("graduates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/graduates/1").to route_to("graduates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/graduates/1").to route_to("graduates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/graduates/1").to route_to("graduates#destroy", :id => "1")
    end

  end
end
