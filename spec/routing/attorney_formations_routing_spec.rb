require "spec_helper"

describe AttorneyFormationsController do
  describe "routing" do

    it "routes to #index" do
      get("/attorney_formations").should route_to("attorney_formations#index")
    end

    it "routes to #new" do
      get("/attorney_formations/new").should route_to("attorney_formations#new")
    end

    it "routes to #show" do
      get("/attorney_formations/1").should route_to("attorney_formations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/attorney_formations/1/edit").should route_to("attorney_formations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/attorney_formations").should route_to("attorney_formations#create")
    end

    it "routes to #update" do
      put("/attorney_formations/1").should route_to("attorney_formations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/attorney_formations/1").should route_to("attorney_formations#destroy", :id => "1")
    end

  end
end
