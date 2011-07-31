WishToGo::Application.routes.draw do

  # get "place" => "places#show", :genre_en_name => "shumienntame"
  # get "place/search" => "places#search", :genre_en_name => "shumienntame"
  

  resources :places do
    get :search, :on => :collection
  end

  match 'register_place/:id' => 'users#register_place', :via => [:get], :as => :register_place
  match 'register_place/:id' => 'users#register', :via => [:post], :as => :register_place
  match 'register_place/:id' => 'users#update_place', :via => [:put], :as => :register_place
  match 'my_list' => 'users#my_list', :via => [:get], :as => :my_list
  match 'my_list/detail/:id' => 'users#my_list_detail', :via => [:get], :as => :my_list_detail

  match '/auth/failure'            => 'sessions#failure'
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin'                  => 'sessions#new', :as => :signin
  match '/login'                  => 'sessions#dummy_login', :as => :signin
  match '/signout'                 => 'sessions#destroy', :as => :signout  

  # resources :seo_keywords, :only => [:index, :update] do
  #   resource :ad, :only => [:edit, :update, :show]
  #   resource :seo_text, :only => [:edit, :update]
  #   # put 'allupdate', :on => :member
  #   put :allupdate, :on => :collection
  #   post :csv_upload, :on => :collection
  #   get :csv_download, :on => :collection
  # end

  # resources :sites, :only => [:index, :create, :edit, :update] do
  #   get :display_code, :on => :member
  # end



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "places#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
