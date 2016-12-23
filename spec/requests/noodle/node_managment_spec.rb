require "rails_helper"

module Noodle
  RSpec.describe "Node management", :type => :request do

    it "creates a Node" do
      headers = {
        "ACCEPT" => "application/json",     # This is what Rails 4 accepts
        "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
      }
      post "/noodle/nodes", { :service => 'foo', :class => 'foo', :node_properties => {:foo => "bar"} }, headers

      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:created)
    end

  end
end
