# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tags = %w[skydive mars travel paris travel romance education work food 
		explore cook #blessed]
(0..10).each do |i|
	user = User.create(first_name: "user#{i}", email: "user#{i}@test.com", password: "password",password_confirmation: "password")
	list = List.create(title: "user#{i} list",description:"user#{i} descr for list",user_id: user.id)
	(1..5).each do |j|
		item = Item.create(title:"user#{i} item#{j} title", description:"item#{j} title", tag_list: [tags.sample,tags.sample])
		ListsItem.create(list_id: list.id, item_id: item.id, completed: false)
	end
end