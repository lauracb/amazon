Rails.application.routes.draw do
  # Index, Root or Home
  root 'home#index'

  resources :posts do
    resources :comments
    # va a crear adicionalmente una ruta para publish con el método patch o put (sirven para actualizar) --> ruta personalizada
    member do
      patch :publish
    end
  end

  resources :subscriptors, only: [:new, :create, :index, :show]

  ## Admin Routes
  get 'admin', to: 'admin#index'
  get 'admin/products', to: 'admin#products'
  # get 'admin/index'
  # get 'admin/show'

  ##Products routes
  resources :products, only: [:new, :create] #a estas rutas tendrá acceso el user

  # #   get 'posts/index', to: 'posts#index'
  # #   get 'posts/create', to: 'posts#create'
  # # # En total 8 rutas. que con resources se crean automáticamente
  
  # # Home Routes
  # #get 'home', to: 'home#index' #sintáxis más común
  # #get '/home/:name', to: 'home#hello' #hello es una nueva acción y :name es una variable de ruta
  # #get 'home/index'
  # get '/home/index', to: 'home#index', as: 'cualquier_cosa' #sintaxis sinónima a la línea anterior, el as es como un alias y sirve para hacer links
  # get '/home/about', to: 'home#about'
  # get '/home/contact_us', to: 'home#contact_us'
  # get '/home/prices', to: 'home#prices'

  #  # Blog Routes
  # get 'blog/index'
  # get 'blog/new'
  # get 'blog/show'
  # get 'blog/edit'
  
 

  # Devise
  devise_for :users # se verifican las rutas con rails routes

  
  

end
