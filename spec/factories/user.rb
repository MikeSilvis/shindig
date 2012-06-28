require 'factory_girl'

FactoryGirl.define do
	sequence(:username) { |n| "displayname#{n}"}
  sequence(:email) { |n| "email#{n}@example.com"}

  factory :user do
    email {FactoryGirl.generate(:email)}
    username {FactoryGirl.generate(:username)}
  end
end
