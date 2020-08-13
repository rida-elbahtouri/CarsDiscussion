Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root to:"thoughts#index"
  resources :thoughts
  get '/whotofollow', to: 'followings#whotofollow'
  get '/follow', to: 'followings#follow',as: "follow"
  resources :sessions, only: [:new, :create, :destroy]
end
