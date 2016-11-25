class NodeImplProperty < ActiveRecord::Base
  #include PropertyValueAssignable
  
  belongs_to :node_impl
  belongs_to :node_class_property
  validates :node_class_property, :presence => true
  
  def value=(value)
    self["#{self.node_class_property.properties['type']}_value"] = value
  end

  def value
    self["#{self.node_class_property.properties['type']}_value"]
  end
end
