class UsersController < ApplicationController
  def my_list
    @places = current_user.places

    respond_to do |f|
      f.html
      f.json {
        a = []
        @places.each_with_index do |p, i|
          a << {
            id: p.id,
            name: p.name,
            address: p.address,
            star: current_user.user_places[i].star,
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
    @place = Place.find(params[:id])
    current_user
  end

  def register
    @place = Place.find(params[:id])
    current_user
    @current_user.places << @place

    @current_user.user_places.last.star = params[:register_place][:star]
    @current_user.user_places.last.save!

    respond_to do |f|
      f.html { redirect_to :my_list }
    end
    

  end
  
end
