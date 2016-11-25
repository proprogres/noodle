class AddFieldsToNodeImplProperty < ActiveRecord::Migration
  def change
    add_column :node_impl_properties, :binary_value, :binary
    add_column :node_impl_properties, :boolean_value, :boolean
    add_column :node_impl_properties, :date_value, :date
    add_column :node_impl_properties, :datetime_value, :datetime
    add_column :node_impl_properties, :decimal_value, :decimal
    add_column :node_impl_properties, :float_value, :float
    add_column :node_impl_properties, :integer_value, :integer
    add_column :node_impl_properties, :bigint_value, :bigint
    add_column :node_impl_properties, :string_value, :string
    add_column :node_impl_properties, :text_value, :text
    add_column :node_impl_properties, :time_value, :time
    add_column :node_impl_properties, :timestamp_value, :timestamp
  end
end
