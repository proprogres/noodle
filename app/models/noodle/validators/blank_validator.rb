module Noodle
  class BlankValidator < ActiveModel::Validator
    def validate(record)
      if record.node_class_property.properties.key?('validators') && record.node_class_property.properties['validators'].key?('blank')
        record.errors.add(:empty_value, "Value can't be blank", strict: true) if record.value.blank?
      end
    end
  end
end