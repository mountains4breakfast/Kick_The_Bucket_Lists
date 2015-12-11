class ListsItem < ActiveRecord::Base
  belongs_to :list
  belongs_to :item
  validates_presence_of :item_id, :list_id
end
