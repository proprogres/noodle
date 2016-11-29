require 'rails_helper'

RSpec.describe Noodle::Serializers::JSON, :type => :serializer do
  context "properly serialize and unserialize Node and Node Properties" do
    before(:each) do
      @node_class = Noodle::NodeClass.new(name: 'node_class')
      @node_class_property = Noodle::NodeClassProperty.new(
        name: 'node_class_property',
        node_class: @node_class,
        properties: {type: 'string'}
      )
      
      @node = Noodle::Node.new(node_class: @node_class)
      
      @node_property = Noodle::NodeProperty.new(node: @node)
      @node_property.node_class_property = @node_class_property
      
      @node_class.save
      @node_class_property.save
      @node.save
      @node_class_property.save
    end
    it "serializes from JSON" do
      json = {node_class_property: 'property'}.to_json
      @node.from_json(json)
      
      expect(@node.node_properties[0].node_class_property.name).to eq('node_class_property')
      expect(@node.node_properties[0].value).to eq('property')
    end
  end
end