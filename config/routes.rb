Railsapp::Application.routes.draw do   
  root 'application#home'
  get '/success' => 'application#success', :as => :success
  get '/signup' => 'users#new', :as => :signup
  post 'signup' => 'users#create'
  get '/profile' => 'users#show', :as => :profile
  get '/profile/edit' => 'users#edit', :as => :edit_profile
  post '/profile' => 'users#update', :as => :update_profile
  get '/signin' => 'sessions#new', :as => :signin
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
  
  get '/surveys/new' => 'surveys#new', :as => :new_survey
  post '/surveys' => 'surveys#create', :as => :create_survey
  get '/surveys/:id' => 'surveys#continue', :as => :continue_survey
  post '/surveys/:id' => 'surveys#update_survey', :as => :update_survey
  get '/take_survey/:random_string' => 'surveys#show', :as => :take_survey
  post '/take_survey/:random_string' => 'surveys#update'
  resources :suggested_questions
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
