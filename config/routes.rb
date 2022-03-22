Rails.application.routes.draw do


  get 'todos/index'
  get 'todos/edit'
  get 'todos/new'
  get 'todos/show'
  get 'todos/index'
  get 'todos/edit'
  get 'todos/show'
  get 'todos/new'
  get 'todos/index'
  get 'todos/edit'
  get 'todos/show'
  devise_for :users
  root to: "home#index"
  resources :users
  resources :todos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
