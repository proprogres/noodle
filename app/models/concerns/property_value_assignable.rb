module PropertyValueAssignable
  extend ActiveSupport::Concern
  included do
    # puts self.class.
    after_initialize :assign_property
  end
  def assign_property
    self["#{self.node_class_property.properties['type']}_value"] = self.value
  end
end