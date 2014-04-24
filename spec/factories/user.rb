FactoryGirl.define do
	factory :user do
		name "Hector Felix"
		email "hector.felix@email.com"
		password "helloworld"
		password_confirmation "helloworld"
		confirmed_at Time.now
	end
end
