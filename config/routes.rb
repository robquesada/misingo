Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'iniciar', to: 'login#index', as: 'login'
  get 'inicio', to: 'main#home', as: 'home'

  resources :pets, path: 'mascotas' do
    resource :lost_report, path: 'extravios' do
      resource :flyer, path: 'cartel', only: :show
    end
  end

  get 'perfil', to: 'users#index', as: 'profile'

  root 'login#index'
end
