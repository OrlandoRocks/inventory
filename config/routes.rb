Rails.application.routes.draw do

  resources :quotations
  resources :hydraulic_jacks
  resources :pull_types
  resources :brake_types
  resources :reinforcement_types
  resources :fender_types
  resources :turn_types
  resources :divition_types
  resources :suspension_types
  resources :roof_types
  resources :colors
  resources :trailer_widths
  resources :trailer_lengths
  resources :trailer_heights
  resources :ramp_types
  resources :redila_types
  resources :floor_types
  resources :capacities
  resources :trailer_types
  resources :status_shippings
  resources :fiscal_vouchers
  resources :trailers
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :offices
  get 'items/next_maintenances', to: 'items#next_maintenances', as: :items_next_maintenances
  put 'items/:id/change_maintenance_done/:value', to: 'items#change_maintenance_done', as: :items_change_maintenance_done

  get 'reporter', to: 'items#reporter', as: :reporter

  get '/branches/departments', to: 'branches#departments'

  get '/categories/sub_categories', to: 'categories#sub_categories'

  get '/branches/:id/departments', to: 'branches#departments_for_select'

  get '/terminos_condiciones', to: 'home#terminos_condiciones'

  get '/user_employee_nomber/:employee_nomber', to: 'application#user_employee_nomber'

  delete 'departments/:department_id/employee/:id', to: 'departments#destroy_employee', as: :destroy_department_employee
  delete '/destroy_category/:category_id/:trailer_type_id', to: 'trailer_types#destroy_category'



  mount ActionCable.server, at: '/cable'

  # mount Plutus::Engine => "/plutus", :as => "plutus"

  resources :items
  resources :providers
  resources :maintenances
  resources :status_items
  resources :brands
  resources :sub_categories
  resources :categories
  resources :departments
  resources :branches
  resources :companies
  resources :permissions
  resources :roles
  resources :work_articles


  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do

      get 'get_items/:token' => 'inventory_manager#get_items'
      get 'get_items_not_sell/:user_id/:token' => 'inventory_manager#get_items_not_sell'
      get 'get_items_sell/:user_id/:token' => 'inventory_manager#get_items_sell'
      get 'get_items_order/:user_id/:token' => 'inventory_manager#get_items_order'
      get 'get_orders_shipped/:user_id/:token' => 'inventory_manager#get_orders_shipped'
      get 'get_branches/:token' => 'inventory_manager#get_branches'
      get 'get_cities/:token' => 'inventory_manager#get_cities'
      get 'get_states/:token' => 'inventory_manager#get_states'
      get 'get_trailers/:token' => 'inventory_manager#get_trailers'
      get 'get_categories/:token' => 'inventory_manager#get_categories'
      get 'get_sub_categories/:token' => 'inventory_manager#get_sub_categories'
      get 'get_status_item/:token' => 'inventory_manager#get_status_item'
      get 'get_status_shipping/:token' => 'inventory_manager#get_status_shipping'
      get 'get_trailer_types/:token' => 'inventory_manager#get_trailer_types'
      get 'get_fiscal_vouchers/:token' => 'inventory_manager#get_fiscal_vouchers'
      get 'get_clients/:token' => 'inventory_manager#get_clients'
      get 'get_items_by_branch/:token/:id' => 'inventory_manager#get_items_by_branch'

      put 'sign_up_guest' => 'users_manager#sign_up_guest'
      put 'create_item' => 'inventory_manager#create_item'
      put 'update_item' => 'inventory_manager#update_item'
      put 'create_trailer' => 'trailer_manager#create_trailer'
      put 'update_trailer' => 'trailer_manager#update_trailer'
      put 'create_client' => 'client_manager#create_client'
      put 'update_client' => 'client_manager#update_client'
      put 'save_token' => 'users_manager#save_token'
      put 'login_user' => 'users_manager#login_user'

      delete 'destroy_client' => 'client_manager#destroy_client'
      delete 'destroy_trailer' => 'trailer_manager#destroy_trailer'
      delete 'destroy_item' => 'inventory_manager#destroy_item'

    end
  end

  devise_for :users,
             controllers: {sessions: 'users/sessions',
                           confirmations: 'users/confirmations',
                           unlocks: 'users/unlocks',
                           registrations: 'users/registrations',
                           passwords: 'users/passwords',
                           password_expired: 'users/password_expired'},
             path: '/',
             path_names: {sign_in: 'login',
                          sign_out: 'logout'}

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
      get '/users/sessions/remolques_new' => 'users/sessions#remolques_new', as: :login_remolques
    end

    authenticate :user do
      put '/users/assign_item' => 'users/registrations#assign_item', as: :users_assign_item
      put '/users/unassign_item' => 'users/registrations#unassign_item', as: :users_unassign_item

      # Shows all users.
      get '/users', to: 'users/registrations#index', as: :user_registrations
      get '/employees', to: 'users/registrations#employees_index', as: :employees
      get '/employee/:id/assign_work_articles', to: 'users/registrations#assign_work_articles',
          as: :employee_assign_work_articles
      post '/employee/add_work_article', to: 'users/registrations#add_work_article',
           as: :employee_add_work_article
      match '/employee/remove_work_article', to: 'users/registrations#remove_work_article',
            as: :employee_remove_work_article, via: [:patch, :put]
      get '/search_work_articles/:id/:search_type', to: 'users/registrations#search_work_articles',
          as: :search_work_articles

      # Create new users.
      get '/users/new', to: 'users/registrations#new_user', as: :new_user
      get '/employee/new', to: 'users/registrations#new_employee', as: :new_employee
      post '/users', to: 'users/registrations#create_user', as: :create_user



      # Create new users.
      get '/users/employee_department', to: 'users/registrations#new_employee_department', as: :new_employee_department
      #post '/users', to: 'users/registrations#create_user', as: :create_user

      #Get Branch for user
      get '/get_branch_user/:id', to: 'branches#get_branch_user'

      #GET Category and sub category by trailer
      get '/category_subcategory/:id', to: 'trailers#get_category_subcategory'

      # Edit page for a user profile.
      get '/users/edit', to: 'users/registrations#edit', as: :edit_profile
      match '/users', to: 'users/registrations#update_profile', as: :update_profile, via: [:patch, :put]
      match '/users/update_password', to: 'users/registrations#update_password', as: :update_password, via: [:patch, :put]


      # User image
      match '/users/:id/get_user_image', to: 'users/registrations#get_user_image', as: :get_user_image, via: [:patch, :put]

      # Edit page for all users.
      get '/users/:id/edit', to: 'users/registrations#edit_user', as: :edit_user
      match '/users/:id', to: 'users/registrations#update_user', as: :update_user, via: [:patch, :put]

      # Show page for a user.
      get '/users/:id', to: 'users/registrations#show', as: :user

      # Edit a user password.
      get '/users/:id/change_password', to: 'users/registrations#change_password', as: :change_password
      match 'save_password/:id', to: 'users/registrations#save_password', as: :save_password,
            via: [:patch, :put]

      # Destroys a user
      delete '/users/:id', to: 'users/registrations#destroy', as: :destroy_user_registration

      # Gets a JS response with all controller actions.
      get '/permissions/new/get_controller_actions', to: 'permissions#get_controller_actions', as: :get_controller_actions

      # Posts seed data from permissions in relation with their role.
      post '/permissions/generate_seeds', to: 'permissions#generate_seeds', as: :generate_seeds

      # Displays a role with every permission granted.
      get '/roles/:role_id/permissions', to: 'roles#role_permissions', as: :role_permissions

      # Creates a relationship between roles and permissions.
      post '/roles/:role_id/assign_permissions', to: 'roles#assign_permissions', as: :assign_permissions

      # Sets the language to spanish.
      get '/set_language/spanish'

      # Sets the language to english.
      get '/set_language/english'


      #Rutas para la generación de reportes
      get 'reports/sales' => 'reports#report_sales'
      #Rutas para enviar correos
      get '/send_email/:id' => 'items#send_email'


      get '/income_statement' => 'items#income_statement'


      #add Files to Items details from angular
      post '/item_file/:id' => 'items#create_file'
      post '/item_maintenance/:id' => 'items#create_maintenance'
      get '/items_excel' => 'items#items_excel'
      get '/item_qr/:id' => 'items#item_qr'
      get 'report/sales/:trailers' => 'items#new_report_sales' #, :defaults => {:format => 'pdf'}
      get 'report/item_sale/:id' => 'items#report_item_sale' #, :defaults => {:format => 'pdf'}


      #add Files to Quotation  from angular
      get 'report/quotation/:id' => 'quotations#report_quotation' #, :defaults => {:format => 'pdf'}

      get 'items_import' => 'items#items_imports'
      resources :items do
        collection { post :import }
      end



      get '/get_maintenances/:id' => 'items#get_maintenances'
      get '/get_files/:id' => 'items#get_files'



      #Regresa la info del articulo que se selecciona en la venta
      get '/cities/:id', to: 'branches#cities'


      get '/next_code_department/:branch_id', to:'branches#next_code'

      #Rutas extras para Departamentos
      get '/departments/:id/items/:employee_id' => 'departments#employee_items', as: :departments_employee_items
      get 'departments_by_branch/:id' => 'departments#get_departments_by_branch'
      get 'all_departments_by_branch/:id' => 'departments#get_all_departments_by_branch'


      #Rutas extras para subcategorias
      get 'subcategory_by_category/:id' => 'sub_categories#get_subcategory_by_category'

      #Ruta para orders
      get 'orders' => 'items#orders'
      get 'orders_shipped' => 'items#orders_shipped'
      get 'new_order' => 'items#new_order', as: :new_order
      get 'edit_order/:id' => 'items#edit_order', as: :edit_order

      #Ruta para cotizaciones
      # get 'quotations' => 'items#quotations'
      # get 'new_quotation' => 'items#new_quotation', as: :new_quotation
      # get 'edit_quotation/:id' => 'items#edit_quotation', as: :edit_quotation

      #Ruta para ventas
      get 'sales' => 'items#sales'

    end
  end

end
