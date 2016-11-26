class CreateNodeClassProperties < ActiveRecord::Migration
  def change
    create_table :noodle_node_class_properties do |t|
      t.string :name, :null => false
      t.text :properties
      t.references :node_class, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
