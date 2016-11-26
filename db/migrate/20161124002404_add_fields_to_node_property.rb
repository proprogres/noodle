class AddFieldsToNodeProperty < ActiveRecord::Migration
  def change
    add_column :noodle_node_properties, :binary_value, :binary
    add_column :noodle_node_properties, :boolean_value, :boolean
    add_column :noodle_node_properties, :date_value, :date
    add_column :noodle_node_properties, :datetime_value, :datetime
    add_column :noodle_node_properties, :decimal_value, :decimal
    add_column :noodle_node_properties, :float_value, :float
    add_column :noodle_node_properties, :integer_value, :integer
    add_column :noodle_node_properties, :bigint_value, :bigint
    add_column :noodle_node_properties, :string_value, :string
    add_column :noodle_node_properties, :text_value, :text
    add_column :noodle_node_properties, :time_value, :time
    add_column :noodle_node_properties, :timestamp_value, :timestamp
  end
end
