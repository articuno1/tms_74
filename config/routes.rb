Rails.application.routes.draw do
  root "static_pages#home"
  get "/signin", to: "session#sign_in"
  post "/signin", to: "session#create"
  delete "/signout", to: "session#destroy"
  get "/signup", to: "users#new"
  get "static_pages/about", as: :about
  get "static_pages/home", as: :home
  get "static_pages/help", as: :help
  get "static_pages/contact", as: :contact
  resources :users, except: :new
  resources :courses
  resources :subjects, only: :index
  resources :tasks, only: :index
  get "/index", to: "index#index"
end
