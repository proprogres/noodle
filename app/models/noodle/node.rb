require_relative 'validators/minimum_number_of_node_properties'

module Noodle
  class Node < ActiveRecord::Base
    belongs_to :node_class
    has_many :node_properties
    validates_with Noodle::MinimumNumberOfNodeProperties
    
    include Noodle::Serializers::JSON
  end
end
