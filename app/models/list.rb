class List < ActiveRecord::Base
  belongs_to :user
  has_many :lists_items, dependent: :destroy
  has_many :items, through: :lists_items
  validates_presence_of :title

 	#returns an arr of #<ActsAsTaggableOn::Tag id: 1, name: "tag1", taggings_count: 5>
 	#of tags specific to 'this' list
 	#can be access in each loop do |i| i.name i.taggings_count
	def tags_and_counts
		#get the items belonging to this list
		items = self.items
		items.tag_counts_on(:tags).order(taggings_count: :desc)
	end
end
