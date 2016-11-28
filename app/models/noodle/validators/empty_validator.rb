module Noodle
  class EmptyValidator < ActiveModel::Validator
    def validate(record)
      if record.node_class_property.properties.key?('validators') && record.node_class_property.properties['validators'].key?('empty')
        record.errors.add(:empty_value, "Value can't be empty", strict: true) if record.value.empty?
      end
    end
  end
end
