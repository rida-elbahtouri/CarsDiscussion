Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root to:"thoughts#index"
  resources :thoughts

  resources :followings,only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
