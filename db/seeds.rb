# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	# 100.times do |n|
 #    	Post.create title: Faker::Name.title,
 #    				body: 	Faker::Lorem.paragraph
	# end


 # Post.all.each do |post| 

 # 	10.times do 
 # 		Comment.create( body: Faker::Lorem.paragraph, post_id: post.id)
 # 	end

 # end


 # 10.times do |n|

 #  Category.create title: Faker::Commerce.department

 # end

 Post.all.each do |post|

  post.category_id = Category.all.sample.id
  post.save

 end