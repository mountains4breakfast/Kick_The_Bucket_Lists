class Item < ActiveRecord::Base
  has_many :lists_items
  has_many :lists, through :lists_items
  validates_presence_of :title
end
