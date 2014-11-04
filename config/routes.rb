Rails.application.routes.draw do
  devise_for :users
  get 'iniciar', to: 'login#index', as: 'login'
  get 'inicio', to: 'main#home', as: 'home'
  get 'breed/:id', to: 'pets#breed_change', as: 'breed_change'

  resources :pets, path: 'mascotas' do
    resource :lost_report, path: 'extravios' do
      resource :flyer, path: 'cartel', only: :show
    end
  end

  root 'login#index'
end