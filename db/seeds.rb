# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create(:provider => "twitter",
            :uid => 9999999,
            :name => "Go Takahashi",
            :screen_name => "goking",)

User.create(:provider => "twitter",
            :uid => 9999998,
            :name => "Hajime Nakamura",
            :screen_name => "hajipong",)


Place.create(:name => "はう")
Place.create(:name => "バスセンター", :address => "福岡県飯塚市")
Place.create(:name => "東京タワー")
Place.create(:name => "富士山")
Place.create(:name => "イタリア")
