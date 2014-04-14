require 'faker'

#Create 5 users with their own posts
5.times do
	password = Faker::Lorem.characters(10)
	user = User.new(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: password,
		password_confirmation: password)
	user.skip_confirmation!
	user.save

	#Note: by calling user.new instead of User.create,
	#we create an instance of User which isn't saved to the db.
	#The skip_confirmation! method sets the confirmation date 
	#to avoid sending an e-mail. The save method updates the db.

	5.times do
	post = Post.create(
		user: user,
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph)
	#set the created_at to a time within the past year
	post.update_attribute(:created_at, Time.now - rand(600..31536000))
	end
end

user = User.first
user.skip_reconfirmation!
user.update_attributes(email: 'hdfelix@gmail.com', password: 'chiracha', password_confirmation: 'chiracha')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
