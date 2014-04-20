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

	#Create 15 topics
	topics = []
	15.times do
		topics << Topic.create(
			name: Faker::Lorem.sentence,
			description: Faker::Lorem.paragraph
		)
	end

	5.times do
		topic = topics.first
		post = Post.create(
		user: user,
		topic: topic,
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph)
	#set the created_at to a time within the past year
	post.update_attribute(:created_at, Time.now - rand(600..31536000))
	post.update_rank

	#Create Comments on posts
	body_text = Faker::Lorem.sentence
	rand(3..6).times do
		rand(1..3).times {body_text << Faker::Lorem.sentence}
		user.comments.create(
			body: body_text,
			post: post
		)	
	end

	topics.rotate!
	end
end

#Create an admin user
admin = User.new(
	name: 'Admin User',
	email: 'hdfelix@gmail.com',
	password: 'chiracha',
	password_confirmation: 'chiracha')
admin.skip_confirmation!
admin.save
admin.update_attribute(:role, 'admin')

#Create a moderator
moderator = User.new(
	name: 'Moderator',
	email: 'hdfnet@gmail.com',

	password: 'chiracha',
	password_confirmation: 'chiracha')
moderator.skip_confirmation!
moderator.save
moderator.update_attribute(:role, 'moderator')

#Create a member
member = User.new(
	name: 'Member',
	email: 'hector.felix@bfa.org',
	password: 'chiracha',
	password_confirmation: 'chiracha')
member.skip_confirmation!
member.save
member.update_attribute(:role, 'member')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
