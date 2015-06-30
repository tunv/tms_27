class AddTargetIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :target_id, :integer
  end
end
