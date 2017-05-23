Rails.application.routes.draw do

  root to: 'articles#index'

  resources :articles
  resources :users

  get '/search', to: 'articles#search', as: :search

end
