# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  def my_list

    if current_user
      @places = @current_user.places
    else
      @current_user = User.find(params[:user_id])
      @places = @current_user.places
    end

    respond_to do |f|
      f.html
      f.json {
        a = []
        @places.each_with_index do |p, i|
          a << {
            id: p.id,
            name: p.name,
            address: p.address,
            star: @current_user.user_places[i].star,
            created_at: @current_user.user_places[i].created_at,
            location: {
              lat: p.latitude,
              lng: p.longitude,
            }
          }
        end
        render :json => a.to_json
      }
    end

  end
  def register_place
    
    place_id = params[:id]
    @header_place = Place.includes(:user_places).find(place_id)

    @register_place = UserPlace.find_by_place_id_and_user_id place_id, current_user.id

  end

  def register
    @place = Place.find(params[:id])
    current_user
    UserPlace.create(:user_id => @current_user.id,
                     :place_id => @place.id,
                     :star => params[:register_place][:star],)

    respond_to do |f|
      f.html { redirect_to :my_list }
    end
    

  end
  
end
