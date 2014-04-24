FactoryGirl.define do
	factory :post do
		title "Fist post"
		body "This is the newest post; it needs 20 characters to be saved."
		user
		topic
	end
end
