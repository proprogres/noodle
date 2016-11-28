module Noodle
  class MinValidator < ActiveModel::Validator
    def validate(record)
      if record.node_class_property.properties.key?('validators') && record.node_class_property.properties['validators'].key?('min')
        record.errors.add(:empty_value, "Valu is to small", strict: true) if (record.value.to_i < record.node_class_property.properties['validators']['min'])
      end
    end
  end
end