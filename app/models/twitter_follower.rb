class TwitterFollower < ActiveRecord::Base
  attr_accessible :user_id, :username, :name, :avatar
  belongs_to :user

end
