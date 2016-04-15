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
  get 'subcommittee_index/:committee_type/' => 'subcommittee#index', as: :committee_index
  
  # Subcommittee Announcement
  get 'executive_committee/new_executive_announcement' => 'subcommittee_announcement#new_executive_announcement', as: :new_executive_announcement
  put 'executive_committee/create_executive_announcement' => 'subcommittee_announcement#create_executive_announcement', as: :create_executive_announcement
  get 'executive_committee/:id/edit_executive_announcement' => 'subcommittee_announcement#edit_executive_announcement', as: :edit_executive_announcement
  put 'executive_committee/:id/edit_executive_announcement' => 'subcommittee_announcement#update_executive_announcement', as: :update_executive_announcement
  get 'executive_committee/:id/delete_executive_announcement' => 'subcommittee_announcement#delete_executive_announcement', as: :delete_executive_announcement
  
  get 'external_committee/new_external_announcement' => 'subcommittee_announcement#new_external_announcement', as: :new_external_announcement
  put 'external_committee/create_external_announcement' => 'subcommittee_announcement#create_external_announcement', as: :create_external_announcement
  get 'external_committee/:id/edit_external_announcement' => 'subcommittee_announcement#edit_external_announcement', as: :edit_external_announcement
  put 'external_committee/:id/edit_external_announcement' => 'subcommittee_announcement#update_external_announcement', as: :update_external_announcement
  get 'external_committee/:id/delete_external_announcement' => 'subcommittee_announcement#delete_external_announcement', as: :delete_external_announcement
  
  get 'internal_committee/new_internal_announcement' => 'subcommittee_announcement#new_internal_announcement', as: :new_internal_announcement
  put 'internal_committee/create_internal_announcement' => 'subcommittee_announcement#create_internal_announcement', as: :create_internal_announcement
  get 'internal_committee/:id/edit_internal_announcement' => 'subcommittee_announcement#edit_internal_announcement', as: :edit_internal_announcement
  put 'internal_committee/:id/edit_internal_announcement' => 'subcommittee_announcement#update_internal_announcement', as: :update_internal_announcement
  get 'internal_committee/:id/delete_internal_announcement' => 'subcommittee_announcement#delete_internal_announcement', as: :delete_internal_announcement

  # Subcommittee Document List
  get 'executive_committee/new_executive_document_list' => 'subcommittee_document_list#new_executive_document_list', as: :new_executive_document_list
  put 'executive_committee/create_executive_document_list' => 'subcommittee_document_list#create_executive_document_list', as: :create_executive_document_list
  get 'executive_committee/:id/edit_executive_document_list' => 'subcommittee_document_list#edit_executive_document_list', as: :edit_executive_document_list
  put 'executive_committee/:id/edit_executive_document_list' => 'subcommittee_document_list#update_executive_document_list', as: :update_executive_document_list
  get 'executive_committee/:id/delete_executive_document_list' => 'subcommittee_document_list#delete_executive_document_list', as: :delete_executive_document_list
  
  get 'external_committee/new_external_document_list' => 'subcommittee_document_list#new_external_document_list', as: :new_external_document_list
  put 'external_committee/create_external_document_list' => 'subcommittee_document_list#create_external_document_list', as: :create_external_document_list
  get 'external_committee/:id/edit_external_document_list' => 'subcommittee_document_list#edit_external_document_list', as: :edit_external_document_list
  put 'external_committee/:id/edit_external_document_list' => 'subcommittee_document_list#update_external_document_list', as: :update_external_document_list
  get 'external_committee/:id/delete_external_document_list' => 'subcommittee_document_list#delete_external_document_list', as: :delete_external_document_list
  
  get 'internal_committee/new_internal_document_list' => 'subcommittee_document_list#new_internal_document_list', as: :new_internal_document_list
  put 'internal_committee/create_internal_document_list' => 'subcommittee_document_list#create_internal_document_list', as: :create_internal_document_list
  get 'internal_committee/:id/edit_internal_document_list' => 'subcommittee_document_list#edit_internal_document_list', as: :edit_internal_document_list
  put 'internal_committee/:id/edit_internal_document_list' => 'subcommittee_document_list#update_internal_document_list', as: :update_internal_document_list
  get 'internal_committee/:id/delete_internal_document_list' => 'subcommittee_document_list#delete_internal_document_list', as: :delete_internal_document_list
  
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
