class AddCategoryToEventGroupResources < ActiveRecord::Migration
  def self.up
    add_column :event_group_resources, :category, :string
  end

  def self.down
    remove_column :event_group_resources, :category
  end
end
