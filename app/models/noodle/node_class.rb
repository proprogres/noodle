module Noodle
  class NodeClass < ActiveRecord::Base
    has_many :node_class_properties
  end
end
