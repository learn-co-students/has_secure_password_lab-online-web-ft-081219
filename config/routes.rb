Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post "/login", to: "sessions#create"
  post "/user", to: "users#create"
  get  "/user/new", to: "users#new"
end
