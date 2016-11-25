FactoryGirl.define do
  factory :node_class do 
    name Faker::Internet.slug
    after(:create) do |n|
      create_list(:node_class_property_string_min_length_5, 1, node_class: n)
      create_list(:node_class_property_string_max_length_5, 1, node_class: n)
    end
  end
end