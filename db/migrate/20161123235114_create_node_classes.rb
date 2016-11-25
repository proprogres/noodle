class CreateNodeClasses < ActiveRecord::Migration
  def change
    create_table :node_classes do |t|
      t.string :name, :null => false, :unique => true
      t.text :description

      t.timestamps null: false
    end
  end
end
