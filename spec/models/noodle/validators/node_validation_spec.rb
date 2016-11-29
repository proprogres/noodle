require 'rails_helper'
require 'date'

RSpec.describe Noodle::Node, :type => :model do
  context "properly validates Node before save" do
    it "validates if Node has at least one property" do
      node_class = Noodle::NodeClass.new(name: 'node_class')
      node = Noodle::Node.new(node_class: node_class)
      
      expect{node.save}.to raise_error
      
      node_class_property = Noodle::NodeClassProperty.new(
        name: 'node_class_property',
        node_class: node_class
      )
      node_property = Noodle::NodeProperty.new({node: node, node_class_property: node_class_property})
      node.node_properties << node_property
      
      expect{node.save}.not_to raise_error
    end
  end
end