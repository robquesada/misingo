Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :lost_reports, path: 'extravios' do
    resource :flyer do
      get :show
      get :preview
    end
  end

  resources :invites, only: :create

  get 'perfil', to: 'users#index', as: 'profile'

  root 'main#home'
end
