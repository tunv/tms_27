class AddContentToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :content, :string
  end
end
