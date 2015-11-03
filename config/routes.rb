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

  resources :adoptions, path: 'adopciones'
  resources :users, only: [:show, :edit, :update]
  resources :invites, only: :create

  get 'contacto', to: 'main#contact', as: 'contact'
  get 'perfil', to: 'users#show', as: 'profile'

  root 'adoptions#index'
end
