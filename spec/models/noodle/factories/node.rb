require 'rails_helper'

RSpec.describe Noodle::Factories::Node, :type => :factory do
  context "properly creates Node for given params" do
    before(:each) do
      @node_class = Noodle::NodeClass.new(name: 'node_class')
      @node_class_property_foo = Noodle::NodeClassProperty.new(
        name: 'foo',
        node_class: @node_class,
        properties: {type: 'string'}
      )
      @node_class_property_baz = Noodle::NodeClassProperty.new(
        name: 'baz',
        node_class: @node_class,
        properties: {type: 'string'}
      )
      
      @node_class_property_foo.save
      @node_class_property_baz.save
      
    end
    it "creates for node_class and properties params" do
      json = {foo: 'bar', baz: 'quux'}.to_json
      
      created_node = Noodle::Factories::Node.create('node_class', json)
      
      node = Noodle::Node.new(node_class: @node_class)
      node.from_json(json)

      expect(created_node.node_class.name).to eq(node.node_class.name)
      expect(created_node.node_properties.first.node_class_property.name).to eq(node.node_properties.first.node_class_property.name)
      expect(created_node.node_properties.last.node_class_property.name).to eq(node.node_properties.last.node_class_property.name) 
    end
  end
end
