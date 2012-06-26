class Restaraunt < ActiveRecord::Base
  has_many :menus
  validates_uniqueness_of :name

end
