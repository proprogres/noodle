module Noodle
  class NodeClassProperty < ActiveRecord::Base
    belongs_to :node_class
    serialize :properties, JSON
  end
end
