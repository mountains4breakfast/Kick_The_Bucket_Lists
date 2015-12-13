class AddCompletedToListsItems < ActiveRecord::Migration
  def change
    add_column :lists_items, :completed, :boolean, default: false
  end
end
