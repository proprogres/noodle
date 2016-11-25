require 'rails_helper'
require 'date'

RSpec.describe NodeImplProperty, :type => :model do
  context "properly assigns value based on type while setting" do
    before(:each) do
      @node_class = NodeClass.new(name: 'node_class')
      @node_impl = NodeImpl.new(node_class: @node_class)
      @node_class_property = NodeClassProperty.new(
        name: 'node_class_property',
        node_class: @node_class
      )
      @node_impl_property = NodeImplProperty.new(node_impl: @node_impl)
      @node_impl_property.node_class_property = @node_class_property
    end
    it "assigns binary value" do
      @node_class_property.properties = {type: 'binary'}
      bin = "\xD1\x9B\x86".b
      @node_impl_property.value = bin
      @node_impl_property.save
      
      expect(@node_impl_property.binary_value).to eq(bin)
    end
    it "assigns boolean value" do
      @node_class_property.properties = {type: 'boolean'}
      boolean = true
      @node_impl_property.value = boolean
      @node_impl_property.save
      
      expect(@node_impl_property.boolean_value).to eq(boolean)
    end
    it "assigns date value" do
      @node_class_property.properties = {type: 'date'}
      date = Date.new()
      @node_impl_property.value = date
      @node_impl_property.save
      
      expect(@node_impl_property.date_value).to eq(date)
    end
    it "assigns datetime value" do
      @node_class_property.properties = {type: 'datetime'}
      datetime = Date.new()
      @node_impl_property.value = datetime
      @node_impl_property.save
      
      expect(@node_impl_property.datetime_value).to eq(datetime)
    end
    it "assigns decimal value" do
      @node_class_property.properties = {type: 'decimal'}
      decimal = 1.2
      @node_impl_property.value = decimal
      @node_impl_property.save
      
      expect(@node_impl_property.decimal_value).to eq(decimal)
    end
    it "assigns float value" do
      @node_class_property.properties = {type: 'float'}
      float = 1.2
      @node_impl_property.value = float
      @node_impl_property.save
      
      expect(@node_impl_property.float_value).to eq(float)
    end
    it "assigns integer value" do
      @node_class_property.properties = {type: 'integer'}
      integer = 2
      @node_impl_property.value = integer
      @node_impl_property.save
      
      expect(@node_impl_property.integer_value).to eq(integer)
    end
    it "assigns bigint value" do
      @node_class_property.properties = {type: 'bigint'}
      bigint = 123456789 ** 2
      @node_impl_property.value = bigint
      @node_impl_property.save
      
      expect(@node_impl_property.bigint_value).to eq(bigint)
    end
    it "assigns string value" do
      @node_class_property.properties = {type: 'string'}
      string = 'string'
      @node_impl_property.value = string
      @node_impl_property.save
      
      expect(@node_impl_property.string_value).to eq(string)
    end
    it "assigns text value" do
      @node_class_property.properties = {type: 'text'}
      text = 'text'
      @node_impl_property.value = text
      @node_impl_property.save
      
      expect(@node_impl_property.text_value).to eq(text)
    end
    it "assigns time value" do
      @node_class_property.properties = {type: 'time'}
      time = Time.new
      @node_impl_property.value = time
      @node_impl_property.save
      
      expect(@node_impl_property.time_value).to eq(time)
    end
    it "assigns timestamp value" do
      @node_class_property.properties = {type: 'timestamp'}
      timestamp = Time.now
      @node_impl_property.value = timestamp
      @node_impl_property.save
      
      expect(@node_impl_property.timestamp_value).to eq(timestamp)
    end
  end
  
  context "properly assigns value based on type while getting" do
    before(:each) do
      @node_class = NodeClass.new(name: 'node_class')
      @node_impl = NodeImpl.new(node_class: @node_class)
      @node_class_property = NodeClassProperty.new(
        name: 'node_class_property',
        node_class: @node_class
      )
      @node_impl_property = NodeImplProperty.new(node_impl: @node_impl)
      @node_impl_property.node_class_property = @node_class_property
    end
    it "assigns binary value" do
      @node_class_property.properties = {type: 'binary'}
      bin = "\xD1\x9B\x86".b
      @node_impl_property.binary_value = bin
      @node_impl_property.save
      
      expect(@node_impl_property.value).to eq(bin)
    end
    it "assigns boolean value" do
      @node_class_property.properties = {type: 'boolean'}
      boolean = true
      @node_impl_property.boolean_value = boolean
      @node_impl_property.save
      
      expect(@node_impl_property.value).to eq(boolean)
    end
    it "assigns date value" do
      @node_class_property.properties = {type: 'date'}
      date = Date.new
      @node_impl_property.date_value = date
      @node_impl_property.save
      
      expect(@node_impl_property.value).to eq(date)
    end
    it "assigns datetime value" do
      @node_class_property.properties = {type: 'datetime'}
      datetime = Date.new
      @node_impl_property.datetime_value = datetime
      @node_impl_property.save
      
      expect(@node_impl_property.value).to eq(datetime)
    end
    it "assigns decimal value" do
      @node_class_property.properties = {type: 'decimal'}
      decimal = 1.2
      @node_impl_property.decimal_value = decimal
      @node_impl_property.save
      
      expect(@node_impl_property.value).to eq(decimal)
    end
    it "assigns float value" do
      @node_class_property.properties = {type: 'float'}
      float = 1.2
      @node_impl_property.float_value = float
      @node_impl_property.save
      
      expect(@node_impl_property.value).to eq(float)
    end
    it "assigns integer value" do
      @node_class_property.properties = {type: 'integer'}
      integer = 2
      @node_impl_property.integer_value = integer
      @node_impl_property.save
      
      expect(@node_impl_property.value).to eq(integer)
    end
  end
end