class Restaraunt < ActiveRecord::Base
  has_many :menus
  attr_accessible :name
  validates_uniqueness_of :name

end
