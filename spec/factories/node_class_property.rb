FactoryGirl.define do
  factory :node_class_property do 
    factory :node_class_property_string do
      node_class
      name "string_prop_1"
      properties {{type: :string}}
    end
    factory :node_class_property_string_min_length_5 do
      node_class
      name "string_prop_2"
      properties {{type: "string", validators: {length: [5, -1]}}}
    end
    factory :node_class_property_string_max_length_5 do
      node_class
      name "string_prop_3"
      properties {{type: "string", validators: {length: [-1, 5]}}}
    end
    factory :node_class_property_string_required do
      node_class
      name "string_prop_4"
      properties {{type: "string", validators: {required: true}}}
    end
    factory :node_class_property_string_not_required do
      node_class
      name "string_prop_5"
      properties {{type: "string", validators: {required: false}}}
    end
    factory :node_class_property_string_regexp_alphanumeric do
      node_class
      name "string_prop_6"
      properties {{type: "string", validators: {regexp: "^[a-zA-Z0-9]*$"}}}
    end
  end
end