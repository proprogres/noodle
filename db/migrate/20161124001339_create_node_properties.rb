class CreateNodeProperties < ActiveRecord::Migration
  def change
    create_table :noodle_node_properties do |t|
      t.references :node, index: true, foreign_key: true, null: false
      t.references :node_class_property, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
