class User < ActiveRecord::Base
  has_many :user_places
  has_many :places, :through => :user_places

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth[:provider]
      user.uid      = auth[:uid]
      user.name     = auth[:user_info]['name']
      user.screen_name = auth[:user_info]['nickname']
    end
  end
end
