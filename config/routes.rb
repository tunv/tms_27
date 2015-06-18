Rails.application.routes.draw do

  root "static_pages#home"
  
  get "help" => "static_pages#help"
  get "signup" => "users#new"
  get "edit" => "users#edit"

  resources :users, except: [:index, :destroy]
end
