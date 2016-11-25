require 'rails_helper'

RSpec.describe NodeImpl do
  let!(:article)     { create :node_impl }
  it "has a valid factory" do
    expect(article).to be_valid
    puts article.node_class.name
  end
end