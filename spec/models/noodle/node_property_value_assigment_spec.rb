require 'rails_helper'
require 'date'

RSpec.describe Noodle::NodeProperty, :type => :model do
  context "properly assigns value based on type while setting" do
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
    it "assigns binary value" do
      @node_class_property.properties = {type: 'binary'}
      bin = "\xD1\x9B\x86".b
      @node_property.value = bin
      @node_property.save
      
      expect(@node_property.binary_value).to eq(bin)
    end
    it "assigns boolean value" do
      @node_class_property.properties = {type: 'boolean'}
      boolean = true
      @node_property.value = boolean
      @node_property.save
      
      expect(@node_property.boolean_value).to eq(boolean)
    end
    it "assigns date value" do
      @node_class_property.properties = {type: 'date'}
      date = Date.new()
      @node_property.value = date.to_s
      @node_property.save
      
      expect(@node_property.date_value).to eq(date)
    end
    it "assigns datetime value" do
      @node_class_property.properties = {type: 'datetime'}
      datetime = Date.new()
      @node_property.value = datetime.to_s
      @node_property.save
      
      expect(@node_property.datetime_value).to eq(datetime)
    end
    it "assigns decimal value" do
      @node_class_property.properties = {type: 'decimal'}
      decimal = 1.2
      @node_property.value = decimal
      @node_property.save
      
      expect(@node_property.decimal_value).to eq(decimal)
    end
    it "assigns float value" do
      @node_class_property.properties = {type: 'float'}
      float = 1.2
      @node_property.value = float
      @node_property.save
      
      expect(@node_property.float_value).to eq(float)
    end
    it "assigns integer value" do
      @node_class_property.properties = {type: 'integer'}
      integer = 2
      @node_property.value = integer
      @node_property.save
      
      expect(@node_property.integer_value).to eq(integer)
    end
    it "assigns bigint value" do
      @node_class_property.properties = {type: 'bigint'}
      bigint = 123456789 ** 2
      @node_property.value = bigint
      @node_property.save
      
      expect(@node_property.bigint_value).to eq(bigint)
    end
    it "assigns string value" do
      @node_class_property.properties = {type: 'string'}
      string = 'string'
      @node_property.value = string
      @node_property.save
      
      expect(@node_property.string_value).to eq(string)
    end
    it "assigns text value" do
      @node_class_property.properties = {type: 'text'}
      text = 'text'
      @node_property.value = text
      @node_property.save
      
      expect(@node_property.text_value).to eq(text)
    end
    it "assigns time value" do
      @node_class_property.properties = {type: 'time'}
      time = Time.new
      @node_property.value = time
      @node_property.save
      
      expect(@node_property.time_value).to eq(time)
    end
    it "assigns timestamp value" do
      @node_class_property.properties = {type: 'timestamp'}
      timestamp = Time.now
      @node_property.value = timestamp
      @node_property.save
      
      expect(@node_property.timestamp_value).to eq(timestamp) 
    end
  end
  
  context "properly assigns value based on type while getting" do
    before(:each) do
      @node_class = Noodle::NodeClass.new(name: 'node_class')
      @node = Noodle::Node.new(node_class: @node_class)
      @node_class_property = Noodle::NodeClassProperty.new(
        name: 'node_class_property',
        node_class: @node_class
      )
      @node_property = Noodle::NodeProperty.new(node: @node)
      @node_property.node_class_property = @node_class_property
      @node.node_properties << @node_property
    end
    it "assigns binary value" do
      @node_class_property.properties = {type: 'binary'}
      bin = "\xD1\x9B\x86".b
      @node_property.binary_value = bin
      @node_property.save
      
      expect(@node_property.value).to eq(bin)
    end
    it "assigns boolean value" do
      @node_class_property.properties = {type: 'boolean'}
      boolean = true
      @node_property.boolean_value = boolean
      @node_property.save
      
      expect(@node_property.value).to eq(boolean)
    end
    it "assigns date value" do
      @node_class_property.properties = {type: 'date'}
      date = Date.new
      @node_property.date_value = date
      @node_property.save
      
      expect(@node_property.value).to eq(date)
    end
    it "assigns datetime value" do
      @node_class_property.properties = {type: 'datetime'}
      datetime = Date.new
      @node_property.datetime_value = datetime
      @node_property.save
      
      expect(@node_property.value).to eq(datetime)
    end
    it "assigns decimal value" do
      @node_class_property.properties = {type: 'decimal'}
      decimal = 1.2
      @node_property.decimal_value = decimal
      @node_property.save
      
      expect(@node_property.value).to eq(decimal)
    end
    it "assigns float value" do
      @node_class_property.properties = {type: 'float'}
      float = 1.2
      @node_property.float_value = float
      @node_property.save
      
      expect(@node_property.value).to eq(float)
    end
    it "assigns integer value" do
      @node_class_property.properties = {type: 'integer'}
      integer = 2
      @node_property.integer_value = integer
      @node_property.save
      
      expect(@node_property.value).to eq(integer)
    end
	it "assigns bigint value" do
      @node_class_property.properties = {type: 'bigint'}
      bigint = 123456789 ** 2
      @node_property.bigint_value = bigint
      @node_property.save
      
      expect(@node_property.value).to eq(bigint)
    end
	it "assigns string value" do
      @node_class_property.properties = {type: 'string'}
      string = 'string'
      @node_property.string_value = string
      @node_property.save
      
      expect(@node_property.value).to eq(string)
    end
	it "assigns text value" do
      @node_class_property.properties = {type: 'text'}
      text = 'text'
      @node_property.text_value = text
      @node_property.save
      
      expect(@node_property.value).to eq(text)
    end
	it "assigns time value" do
      @node_class_property.properties = {type: 'time'}
      time = Time.new
      @node_property.time_value = time
      @node_property.save
      
      expect(@node_property.value).to eq(time)
    end
	it "assigns timestamp value" do
      @node_class_property.properties = {type: 'timestamp'}
      timestamp = Time.now
      @node_property.timestamp_value = timestamp
      @node_property.save
      
      expect(@node_property.value).to eq(timestamp)
    end
  end
end