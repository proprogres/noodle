module Noodle
  class MinLengthValidator < ActiveModel::Validator
    def validate(record)
      if record.node_class_property.properties.key?('validators') && record.node_class_property.properties['validators'].key?('min_length')
        record.errors.add(:empty_value, 'Valu is to short', strict: true) if record.value.length < record.node_class_property.properties['validators']['min_length']
      end
    end
  end
end
