module Noodle
  module ValueValidable
    extend ActiveSupport::Concerns

    #     def validate
    #       # puts self.node_class_property.properties
    #       if self.node_class_property.properties.key?('validators')
    #         self.node_class_property.properties['validators'].each {|k, v|
    #           case k
    #           when 'empty'
    #             validates self.value, :presence => true
    #           end
    #         }
    #       end
    #     end
  end
end
