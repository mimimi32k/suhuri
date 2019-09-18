Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :messages
  resources :users, only: [:index, :edit, :update, :show]
  resources :schools, only: [:index]
  resources :calendars, only: [:index]
  resources :reservations, only: [:index]
  resources :accesses, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
