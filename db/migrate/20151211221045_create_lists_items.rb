class CreateListsItems < ActiveRecord::Migration
  def change
    create_table :lists_items do |t|
      t.belongs_to :list, index: true, foreign_key: true
      t.belongs_to :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
