Rails.application.routes.draw do
      
    post '/gedanken-perlen(.:format)', to: 'pearls#create'
    
    get '/gedanken-perlen/new(.:format)', to: 'pearls#new', as: "new_pearl"
    
    get '/gedanken-perlen/:id/edit(.:format)', to: 'pearls#edit', as: "edit_pearl"
    
    get '/gedanken-perlen/:id(.:format)', to: 'pearls#show', as: "pearl"
    patch '/gedanken-perlen/:id(.:format)', to: 'pearls#update' 
    put '/gedanken-perlen/:id(.:format)', to: 'pearls#update' 
    delete '/gedanken-perlen/:id(.:format)', to: 'pearls#destroy'  
  


  root to: 'pages#home'
  
  devise_for :users
  
  get 'wer-bin-ich', to: 'pages#who', as: "who_am_i"

  get 'was-biete-ich-an', to: 'pages#what', as: "what_do_i_offer"

  get 'gedanken-perlen', to: 'pages#pearl', as: "weekly_pearls"

  get 'forum', to: 'pages#forum', as: "forum"

  get 'kontakt', to: 'pages#contact', as: "contact"
  
  post 'pages/contacted'
  

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
