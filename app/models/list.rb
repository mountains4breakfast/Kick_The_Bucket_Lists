class List < ActiveRecord::Base
  belongs_to :user
  has_many :lists_items, dependent: :destroy
  has_many :items, through: :lists_items
  validates_presence_of :title
  
  end
