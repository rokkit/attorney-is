AttorneyIs::Application.routes.draw do

  resources :attorney_formations


  get "importer/index"

  resources :inform_mails do
    get 'overview' => 'inform_mails#overview', on: :collection
  end


    root :to => 'pages#index'
  devise_for :users, :controllers => {:sessions => "auth/sessions"}, path:'',path_names: {user_registration: "invited_user"}
  post "invited_user" => "devise_invitable/registrations#create"
  resources :domains, shallow: true do
    get 'admin_index' => 'domains#admin_index', on: :collection
    resources :meetings do
      post 'request_for' => 'meetings#request_for_meeting', on: :member
          get 'calendar' => 'meetings#calendar', on: :collection
    end
  end


  resources :request_meetings do
    post 'approve' => 'request_meetings#approve', on: :member
    post 'confirm' => 'request_meetings#confirm', on: :member
    post 'cancel' => 'request_meetings#cancel', on: :member
  end






    match 'pages/admin' => 'pages#admin'
    match 'pages/panel' => 'pages#admin_panel'
    match 'pages/panel' => 'pages#admin_panel'
    match 'admin/settings' => 'pages#settings'
    
    resources :variables
    

      resources :users do
        post 'generate_new_password' => 'users#generate_and_send_password', on: :member
        get 'manage_abilities' => 'users#manage_abilities', on: :member
        post 'send_password_to_all' => 'users#send_password_to_all', on: :collection
        get 'abilities' => 'users#abilities', on: :collection
        collection { 
           post :import
           get :overview 
           get :statistics
         }
      end
  



  
  
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
