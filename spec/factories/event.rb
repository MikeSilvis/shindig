require 'factory_girl'
FactoryGirl.define do
  factory :event do
  	name "Woo"
  	description "ZIP ZAP"
  	zipcode 11111
    street "21 jumpstreet"
  end
end
