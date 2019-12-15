Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "bienvenida", to: "home#index" # la "/" es optativa, es una pagina de destino por ende no es necesario incluirla en REST, no es un recurso que estamos modificando
  get "perfil", to:"users#edit"
  resources :users, only: [:update]

  root to: "home#index"

  # get "articles/user/:user_id", to: "articles#from_author" #ruta que tiene que ver con los articulo pero con filtro de los usuarios
  resources :comments
  resources :categories
  resources :articles do #esta misma linea acepta un bloque para agregar rutas adicionales
    get "user/:user_id", to: "articles#from_author", on: :collection
  end #rutas adicionales que no vienen en los resources como la que involucra a user
  #el on: :collection lo que hace es que la ruta se va a generar para una coleccion, una alternativa es on: :member
  #get "articles", to: "articles#index" #cuando quiero mostrar articulos con accion index
  #get "articles/new", to: "articles#new", as: :new_articles #cuando quiero ver el form de create con accion new
  #get "articles/:id", to: "articles#show" #cuando quiero mostrar un articulo tiene que ser una peticion get hacia la direccion articles/:id que la responda la accion show
  #get "articles/:id/edit", to: "articles#edit" #y asi para todos

  #post "articles", to: "articles#create"
  #delete "articles/:id", to: "articles#destroy"
  end
