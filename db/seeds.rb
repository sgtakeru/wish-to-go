# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

users = [ User.create(:provider => "twitter",
                   :uid => 9999999,
                   :name => "Go Takahashi",
                   :screen_name => "goking",),
       User.create(:provider => "twitter",
                   :uid => 9999998,
                   :name => "Hajime Nakamura",
                   :screen_name => "hajipong",),
     ]

places = [Place.create(:name => "ハウインターナショナル",
                :latitude  => 33.65744480,
                :longitude => 130.68257270, ),
   Place.create(:name => "飯塚バスセンター", :address => "福岡県飯塚市",
                :latitude  => 33.64293,
                :longitude => 130.684964, ),
   Place.create(:name => "東京タワー",
                :latitude  => 35.6495431,
                :longitude => 139.7294396, ),
   Place.create(:name => "富士樹海",
                :latitude  => 35.3642249802915,
                :longitude => 138.7329239802915, ),
   Place.create(:name => "ローマ",
                :latitude  => 41.65587379999999,
                :longitude => 12.2344266, ),
  ]
users.each do |user|
  places.each do |place|
    UserPlace.create(:user_id => user.id,
                     :place_id => place.id,
                     :star => rand(5),)
  end
end
