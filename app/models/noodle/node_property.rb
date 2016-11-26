require_relative 'concerns/value_validable'
module Noodle
  class NodeProperty < ActiveRecord::Base
  
    
    belongs_to :node
    belongs_to :node_class_property
    validates :node_class_property, :presence => true
    validate :validate_value
    # validates :title, presence: true, title: true
    # validates_with MyValidator
    
    def value=(value)
      self["#{self.node_class_property.properties['type']}_value"] = value
    end

    def value
      self["#{self.node_class_property.properties['type']}_value"]
    end
    def validate_value
      if self.node_class_property.properties.key?('validators')
        self.node_class_property.properties['validators'].each {|k, v| 
          case k
          when 'empty'
            if !v
              errors.add(:empty_value, "Can't be empty", strict: true) if value.empty?
            end
          when 'blank'
            if !v
              errors.add(:blank_value, "Can't be blank", strict: true) if value.blank?
            end
          when 'length'
            if v[0] != -1
              errors.add(:length_value, "Can't be to short", strict: true) if value.length < v[0]
            end
            if v[1] != -1
              errors.add(:length_value, "Can't be to long", strict: true) if value.length > v[1]
            end  
          end
        }
      end
    end
  end
end