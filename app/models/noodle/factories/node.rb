module Noodle
  module Factories
    class Node
      def self.create(service_name, node_class_name, properties)
        node_class = Noodle::NodeClass.where(["service = ? and name = ?", service_name, node_class_name]).first
        node = Noodle::Node.new(node_class: node_class)
        
        node.from_json(properties) 
      end
    end
  end
end
