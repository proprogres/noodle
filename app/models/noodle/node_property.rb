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
    validates :node_class_property, presence: true

    validates_with Noodle::EmptyValidator,
                   Noodle::BlankValidator,
                   Noodle::MinLengthValidator,
                   Noodle::MaxLengthValidator,
                   Noodle::MinValidator,
                   Noodle::MaxValidator

    def value=(value)
      self["#{node_class_property.properties['type']}_value"] = cast value
    end

    def value
      self["#{node_class_property.properties['type']}_value"]
    end

    private

    def cast(value)
      case node_class_property.properties['type']
      when 'binary'
        value.b
      when 'boolean'
        !!value
      when 'date'
        value.to_date
      when 'datetime'
        value.to_datetime
      when 'decimal'
        value.to_f
      when 'float'
        value.to_f
      when 'integer'
        value.to_i
      when 'bigint'
        value.to_i
      when 'string'
        value.to_s
      when 'text'
        value.to_s
      when 'time'
        value.to_time
      when 'timestamp'
        # @todo try to find fix with nil in tests
        value
      else
        raise 'Unrecognized value type'
      end
    end
  end
end
