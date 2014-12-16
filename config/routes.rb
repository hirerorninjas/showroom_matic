Rails.application.routes.draw do
  resources :line_items

  resources :carts

  resources :orders

  resources :interns

  resources :job_posters

  resources :free_agents

  resources :investes

  resources :investors

  resources :roles

  resources :salesmen

  resources :likes

  resources :products do
  get :autocomplete, :on => :collection
  end
  resources :categories
  #devise_for :users
  devise_for :users ,:controllers => { :registrations => "registrations" }

  get "welcome/show_dealer"
  get "welcome/show_account"
  match "products/:id/all_likes"=> 'products#all_likes', :as => :all_likes, :via => [:get, :post]
  match "products/:id/unlike_likes"=> 'products#unlike_likes', :as => :unlike_likes, :via => [:get, :post]
 # match 'products/:id/block_deal' => 'products#block_deal', :as => :block_deal
  # match 'products/:id/deal' => 'products#deal', :as => :deal
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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
