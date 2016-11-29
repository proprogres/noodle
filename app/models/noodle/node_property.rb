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
      self["#{node_class_property.properties['type']}_value"] = value
    end

    def value
      self["#{node_class_property.properties['type']}_value"]
    end
  end
end
