module Noodle
  class Node < ActiveRecord::Base
    belongs_to :node_class
    has_many :node_properties
  end
end
