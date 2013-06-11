FactoryGirl.define do
	factory :user do
		sequence(:name) {|n| "Person #{n}"}
		sequence(:email) {|n| "Person_#{n}@chicco.com"}
		password "foobar"
		password_confirmation "foobar"
	end 

	factory :admin do
		admin true
	end

	factory :micropost do 
		content "Lorem Ipsum"
		user
	end 

end