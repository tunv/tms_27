Rails.application.routes.draw do

  root "static_pages#home"
  get "help" => "static_pages#help"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users, except: [:index, :destroy]
  namespace :admin do
    root  "users#index"
    resources :users
    resources :subjects
  end
  resources :courses
end
