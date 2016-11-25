FactoryGirl.define do
  factory :node_impl_property do 
    factory :node_impl_property_string do
      node_impl
      node_class_property_string
      value "Some value"
    end
  end
end