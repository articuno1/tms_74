Rails.application.routes.draw do
  root "session#sign_in"
  get "/signin", to: "session#sign_in"
  post "/signin", to: "session#create"
  delete "/signout", to: "session#destroy"
  resources :users, except: :new
  resources :courses, only: :index
  resources :subjects, only: :index
  resources :tasks, only: :index
  get "/home", to: "index#home"
end
