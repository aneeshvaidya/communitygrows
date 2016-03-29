Rails.application.routes.draw do
  
  
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#authenticate' #redirects to the login page
  resources :dashboard, :only => [:index]
  resources :admin, :only => [:index]
  resources :documents, :only => [:index]
  resources :committee, :only => [:index]


  
  get 'admin/:id/edit_user' => 'admin#edit_user', as: :edit_user
  get 'admin/new_user' => 'admin#new_user', as: :new_user
  delete 'admin/:id' => 'admin#delete_user', as: :delete_user
  put 'admin/:id/update' => 'admin#update_user', as: :update_user
  post 'admin/create' => 'admin#create_user', as: :create_user
  
  put '/admin/update_calendar' => 'admin#update_calendar', as: :update_calendar

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # =>                       controller#method

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
