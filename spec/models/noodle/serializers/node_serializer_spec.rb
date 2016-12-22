require 'rails_helper'

RSpec.describe Noodle::Serializers::JSON, :type => :serializer do
  context "properly serialize and unserialize Node and Node Properties" do
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
      
      @node = Noodle::Node.new(node_class: @node_class)
      
      @node_class_property_foo.save
      @node_class_property_baz.save
    end
    it "serializes from JSON" do
      json = {foo: 'bar', baz: 'quux'}.to_json
      @node.from_json(json)

      expect(@node.node_properties.first.node_class_property.name).to eq('foo')
      expect(@node.node_properties.first.value).to eq('bar')
      expect(@node.node_properties.last.node_class_property.name).to eq('baz')
      expect(@node.node_properties.last.value).to eq('quux')
    end
  end
end
