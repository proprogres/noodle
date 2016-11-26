class CreateNodes < ActiveRecord::Migration
  def change
    create_table :noodle_nodes do |t|
      t.references :node_class, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
