# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show new create index ]
  root to: 'thoughts#index'
  resources :thoughts, only: %i[new create index]

  resources :followings, only: %i[new create destroy]
  resources :sessions, only: %i[new create destroy]
end
