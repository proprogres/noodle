module Noodle
  class MaxLengthValidator < ActiveModel::Validator
    def validate(record)
      if record.node_class_property.properties.key?('validators') && record.node_class_property.properties['validators'].key?('max_length')
        record.errors.add(:empty_value, "Valu is to long", strict: true) if (record.value.length > record.node_class_property.properties['validators']['max_length'])
      end
    end
  end
end