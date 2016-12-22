require "rails_helper"

module Noodle
  class Engine < ::Rails::Engine
    isolate_namespace Noodle
  end

  Engine.routes.draw do
    resources :nodes
  end
  RSpec.describe NodesController, type: :routing do
    routes { Noodle::Engine.routes }
    describe "routing" do

      it "routes to #index" do
        expect(:get => "/nodes").to route_to("noodle/nodes#index")
      end
      it "routes to #new" do
        expect(:get => "/nodes/new").to route_to("noodle/nodes#new")
      end

      it "routes to #show" do
        expect(:get => "/nodes/1").to route_to("noodle/nodes#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/nodes/1/edit").to route_to("noodle/nodes#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/nodes").to route_to("noodle/nodes#create")
      end

      it "routes to #update via PUT" do
        expect(:put => "/nodes/1").to route_to("noodle/nodes#update", :id => "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/nodes/1").to route_to("noodle/nodes#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/nodes/1").to route_to("noodle/nodes#destroy", :id => "1")
      end
    end
  end
end
