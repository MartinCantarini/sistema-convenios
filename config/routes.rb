Rails.application.routes.draw do
  devise_for :users
  resources :agreements
  resources :typeagreements
  resources :signatures
  resources :tracings

  get 'otros/view1'

  get 'otros/view2'

  get 'otros/view3'

  get 'otros/view4'

  get 'otros/view5'

  get 'admin' => 'agreements#admin'
  get 'agreements/:id/delete' => 'agreements#destroy', as: :delete_agreement
  get 'signatures/:id/delete' => 'signatures#destroy', as: :delete_signature
  get 'tracings/:id/delete' => 'tracings#destroy', as: :delete_tracing
  #get 'users/sign_out_out' => 'sessions#destroy', as: :delete_session
 # source :agreements

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'agreements#home'

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
