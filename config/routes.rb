Rails.application.routes.draw do
  get 'temporary_uploads/index'
  get 'users/edit_playlist'
  root 'sessions#login_page'

  get 'home' => 'users#index'
  post 'users/create_playlist'
  get 'users/edit_playlist'
  post 'users/edit_playlist'
  post 'users/upload_song'
  post 'users/upload_song_successfully'
  get 'users/download_song_url_for'
  get 'users/change_playlist'
  post 'users/change_playlist'

  # Log In
  get 'login' => 'sessions#login_page'
  post 'login' => 'sessions#login'

  # Logout
  get 'logout' => 'sessions#logout'

  #Sign Up
  get 'signup' => 'sessions#signup_page'
  post 'signup' => 'sessions#signup'

  #Unsuccessful Log In & Sign Up
  get 'login_error' => 'sessions#login_page_error'
  get 'signup_error' => 'sessions#signup_page_error'

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
