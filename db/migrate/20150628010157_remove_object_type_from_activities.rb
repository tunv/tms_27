class RemoveObjectTypeFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :object_type, :string
  end
end
