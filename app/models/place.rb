class Place < ActiveRecord::Base
  has_many :user_places
  has_many :users, :through => :user_places
end
