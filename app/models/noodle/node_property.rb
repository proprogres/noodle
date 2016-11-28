require 'date'

require_relative 'validators/empty_validator'
require_relative 'validators/blank_validator'
require_relative 'validators/min_length_validator'
require_relative 'validators/max_length_validator'
require_relative 'validators/min_validator'
require_relative 'validators/max_validator'
module Noodle
  class NodeProperty < ActiveRecord::Base
  
    
    belongs_to :node
    belongs_to :node_class_property
    validates :node_class_property, :presence => true

    validates_with Noodle::EmptyValidator,
                   Noodle::BlankValidator,
                   Noodle::MinLengthValidator,
                   Noodle::MaxLengthValidator,
                   Noodle::MinValidator,
                   Noodle::MaxValidator
    
    def value=(value)
      self["#{self.node_class_property.properties['type']}_value"] = cast value
    end

    def value
      self["#{self.node_class_property.properties['type']}_value"]
    end
    
    private
    def cast(value)
      case self.node_class_property.properties['type']
      when 'binary'
        return value.b
      when 'boolean'
        return !!value
      when 'date'
        return value.to_date
      when 'datetime'
        return value.to_datetime
      when 'decimal'
        return value.to_f
      when 'float'
        return value.to_f
      when 'integer'
        return value.to_i
      when 'bigint'
        return value.to_i
      when 'string'
        return value.to_s
      when 'text'
        return value.to_s
      when 'time'
        return value.to_time
      when 'timestamp'
        # @todo try to find fix with nil in tests
        return value
      else
        raise 'Unrecognized value type'
      end
    end
  end
end