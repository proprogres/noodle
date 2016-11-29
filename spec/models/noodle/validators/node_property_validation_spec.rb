require 'rails_helper'
require 'date'

RSpec.describe Noodle::NodeProperty, :type => :model do
  context "properly validates value before save" do
    before(:each) do
      @node_class = Noodle::NodeClass.new(name: 'node_class')
      @node = Noodle::Node.new(node_class: @node_class)
      @node_class_property = Noodle::NodeClassProperty.new(
        name: 'node_class_property',
        node_class: @node_class,
        properties: {}
      )
      @node_property = Noodle::NodeProperty.new(node: @node)
      @node_property.node_class_property = @node_class_property
      @node.node_properties << @node_property
    end
    it "empty validator raise error if value is empty" do
      @node_class_property.properties = {type: 'string', validators: {empty: false}}
      @node_property.value = ''
      expect{@node_property.save}.to raise_error
      @node_property.value = 'str'
      expect{@node_property.save}.not_to raise_error
    end
    it "blank validator raise error if value is blank" do
      @node_class_property.properties = {type: 'string', validators: {blank: false}}
      @node_property.value = ' '
      expect{@node_property.save}.to raise_error
      @node_property.value = 'str'
      expect{@node_property.save}.not_to raise_error
    end
    it "min length validator raise error if string value is to short" do
      @node_class_property.properties = {type: 'string', validators: {min_length: 5}}
      @node_property.value = 'str'
      expect{@node_property.save}.to raise_error
      @node_property.value = 'strstr'
      expect{@node_property.save}.not_to raise_error
    end
    it "max length validator raise error if string value is to long" do
      @node_class_property.properties = {type: 'string', validators: {max_length: 1}}
      @node_property.value = 'str'
      expect{@node_property.save}.to raise_error
      @node_property.value = 's'
      expect{@node_property.save}.not_to raise_error
    end
    it "min length validator raise error if value is lesser than *" do
      @node_class_property.properties = {type: 'string', validators: {min: 10}}
      @node_property.value = 9
      expect{@node_property.save}.to raise_error
      @node_property.value = 11
      expect{@node_property.save}.not_to raise_error
    end
    it "max length validator raise error if value is greater than *" do
      @node_class_property.properties = {type: 'string', validators: {max: 10}}
      @node_property.value = 11
      expect{@node_property.save}.to raise_error
      @node_property.value = 9
      expect{@node_property.save}.not_to raise_error
    end
  end
end