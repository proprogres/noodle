FactoryGirl.define do
  factory :node_impl do
    association :node_class, factory: :node_class, name: "article"
  end
end