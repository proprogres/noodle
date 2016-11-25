class NodeImpl < ActiveRecord::Base
  belongs_to :node_class
  has_many :node_impl_properties
end
