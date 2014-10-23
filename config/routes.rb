Rails.application.routes.draw do
  devise_for :users
  get 'login', to: 'login#index', as: 'login'
  post 'welcome', to: 'main#welcome', as: 'welcome'
  get 'home', to: 'main#home', as: 'home'
  get 'breed/:id', to: 'pets#breed_change', as: 'breed_change'
  resources :pets
  resources :lost_reports
  
  root 'login#index'
end
