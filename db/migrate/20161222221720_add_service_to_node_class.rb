class AddServiceToNodeClass < ActiveRecord::Migration
  def change
    add_column :noodle_node_classes, :service, :string
  end
end
