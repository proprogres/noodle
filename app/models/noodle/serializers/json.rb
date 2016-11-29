require 'json'

module Noodle
  module Serializers
    module JSON
      extend ActiveSupport::Concern
      include ActiveModel::Serialization

      included do
        extend ActiveModel::Naming

        class_attribute :include_root_in_json, instance_writer: false
        self.include_root_in_json = false
      end

      def from_json(json, include_root = include_root_in_json)
        hash = ::JSON.parse(json, {:symbolize_names => true})
        hash = hash.values.first if include_root
        self.node_class.node_class_properties.each do |property|
          key = property.name.to_sym
          if hash.key?(key)
            node_property = NodeProperty.new(node: self, node_class_property: property, value: hash[key])
            # node_property.value = hash[key]
            self.node_properties << node_property
          end
        end
        
        self
      end
    end
  end
end
