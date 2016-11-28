module Noodle
  class MaxValidator < ActiveModel::Validator
    def validate(record)
      if record.node_class_property.properties.key?('validators') && record.node_class_property.properties['validators'].key?('max')
        record.errors.add(:empty_value, 'Valu is to big', strict: true) if record.value.to_i > record.node_class_property.properties['validators']['max']
      end
    end
  end
end
