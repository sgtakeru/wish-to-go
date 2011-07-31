class UsersController < ApplicationController
  def my_list

  end
  def register_place
    @place = Place.find(params[:id])
    current_user
  end

  def register
    @place = Place.find(params[:id])
    current_user
    @current_user.places << @place
    debugger

    @current_user.user_places.last.star = params[:register_place][:star]

  end
  
end
