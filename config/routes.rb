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

  get 'admin/new_announcement' => 'admin#new_announcement', as: :new_announcement
  put 'admin/create_announcement' => 'admin#create_announcement', as: :create_announcement
  get 'admin/:id/edit_announcement' => 'admin#edit_announcement', as: :edit_announcement
  put 'admin/:id/edit_announcement' => 'admin#update_announcement', as: :update_announcement
  get 'admin/:id/delete_announcement' => 'admin#delete_announcement', as: :delete_announcement
  
  get 'dashboard_announcements/:announcement_id/comments' => 'comment#index', as: :comment
  get 'dashboard_announcements/:announcement_id/comments/new_comment' => 'comment#new_comment', as: :new_comment
  post 'dashboard_announcements/:announcement_id/comments/create_comment' => 'comment#create_comment', as: :create_comment
  delete 'dashboard_announcements/:announcement_id/comments/delete_comment/:comment_id' => 'comment#delete_comment', as: :delete_comment

  # Subcommittee
  get 'subcommittee_index/:committee_type/' => 'subcommittee#index', as: :subcommittee_index
  
  # Subcommittee Announcement
  get 'subcommittee_index/:committee_type/new_announcement' => 'announcement#new_announcement', as: :new_committee_announcement
  post 'subcommittee_index/:committee_type/create_announcement' => 'announcement#create_announcement', as: :create_committee_announcement
  delete 'subcommittee_index/:committee_type/:announcement_id/delete_announcement' => 'announcement#delete_announcement', as: :delete_committee_announcement
  get 'subcommittee_index/:committee_type/edit_announcement/:announcement_id' => 'announcement#edit_announcement', as: :edit_committee_announcement
  put 'subcommittee_index/:committee_type/update_announcement/:announcement_id' => 'announcement#update_announcement', as: :update_committee_announcement
  get '/show_announcements' => 'announcement#show_announcements', as: :show_announcements 
  post '/search_announcements' => 'announcement#search_announcements'
  
  # get 'subcommittee_index/:committee_type/new_announcement' => 'announcement#new_announcement', as: :new_committee_announcement
  
  get 'subcommittee_index/:committee_type/new_document' => 'document_list#new_document', as: :new_committee_document
  post 'subcommittee_index/:committee_type/create_document' => 'document_list#create_document', as: :create_committee_document 
  delete 'subcommittee_index/:committee_type/:document_id/delete_document' => 'document_list#delete_document', as: :delete_committee_document
  get 'subcommittee_index/:committee_type/edit_document' => 'document_list#edit_document', as: :edit_committee_document 
  put 'subcommittee_index/:committee_type/update_document' => 'document_list#update_document', as: :update_committee_document
  
  
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
