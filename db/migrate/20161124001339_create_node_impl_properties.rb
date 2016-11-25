class CreateNodeImplProperties < ActiveRecord::Migration
  def change
    create_table :node_impl_properties do |t|
      t.references :node_impl, index: true, foreign_key: true, null: false
      t.references :node_class_property, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
