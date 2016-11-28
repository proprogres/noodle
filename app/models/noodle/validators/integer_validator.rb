module Noodle
  class EmptyValidator < ActiveModel::Validator
    def validate(record)
      if record.node_class_property.properties.key?('validators') && record.node_class_property.properties['validators'].key?('integer')
        record.errors.add(:empty_value, 'Valu must be an integer', strict: true) unless record.value.is_a? Integer
      end
    end
  end
end
