class List < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :lists_items
  has_many :items, through: :lists_items
  validates_presence_of :title
  
  end
