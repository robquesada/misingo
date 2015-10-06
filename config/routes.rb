Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'iniciar', to: 'login#index', as: 'login'

  resources :pets, path: 'mascotas' do
    resource :lost_report, path: 'extravios' do
      resource :flyer, path: 'cartel', only: :show
    end
  end

  resources :invites, only: :create

  get 'perfil', to: 'users#index', as: 'profile'

  root 'main#home'
end
