class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :object_type
      t.string :name
      t.string :object_type
      

      t.timestamps null: false
    end
  end
end
