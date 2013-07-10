require "spec_helper"

describe AdvertisingsController do
  describe "routing" do

    it "routes to #index" do
      get("/advertisings").should route_to("advertisings#index")
    end

    it "routes to #new" do
      get("/advertisings/new").should route_to("advertisings#new")
    end

    it "routes to #show" do
      get("/advertisings/1").should route_to("advertisings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/advertisings/1/edit").should route_to("advertisings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/advertisings").should route_to("advertisings#create")
    end

    it "routes to #update" do
      put("/advertisings/1").should route_to("advertisings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/advertisings/1").should route_to("advertisings#destroy", :id => "1")
    end

  end
end
