Rails.application.routes.draw do
  root "session#sign_in"
  get "/signin", to: "session#sign_in"
  post "/signin", to: "session#create"
  delete "/signout", to: "session#destroy"
  resources :users
end
