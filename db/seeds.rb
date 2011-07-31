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
                :latitude  => 33.656986,
                :longitude => 130.683096, ),
   Place.create(:name => "飯塚バスセンター", :address => "福岡県飯塚市",
                :latitude  => 33.64293,
                :longitude => 130.684964, ),
   Place.create(:name => "東京タワー",
                :latitude => 35.658609,
                :longitude =>139.745447, ),
   Place.create(:name => "富士樹海",
                :latitude  => 35.483736,
                :longitude => 138.618709, ),
   Place.create(:name => "ローマ",
                :latitude  => 41.89052,
                :longitude => 12.494249, ),
  ]
users.each do |user|
  places.each do |place|
    UserPlace.create(:user_id => user.id,
                     :place_id => place.id,
                     :star => rand(5),)
  end
end
