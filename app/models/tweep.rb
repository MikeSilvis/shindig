class Tweep < ActiveRecord::Base
  attr_accessible :user_id, :username, :name, :avatar, :uid

  has_one :users_tweep
  has_one :user, through: :users_tweep

end
