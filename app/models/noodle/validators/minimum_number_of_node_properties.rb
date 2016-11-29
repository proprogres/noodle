module Noodle
  class MinimumNumberOfNodeProperties < ActiveModel::Validator
    def validate(record)
        record.errors.add(:empty_value, 'Node must have at least one property', strict: true) if record.node_properties.length < 1
    end
  end
end
