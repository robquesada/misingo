Rails.application.routes.draw do
  devise_for :users
  get 'iniciar', to: 'login#index', as: 'login'
  match 'bienvenido' => "main#welcome", as: 'welcome', via: [:get, :post]
  get 'inicio', to: 'main#home', as: 'home'
  get 'breed/:id', to: 'pets#breed_change', as: 'breed_change'
  match '/mascotas/nueva' => "pets#new", as: 'new_pet', via: [:get, :post]
  match "/mascotas/nueva_desaparicion" => "pets#new_lost", as: 'new_lost_pet', via: [:get, :post]
  get '/mascotas/:id/editar', to: 'pets#edit', as: 'edit_pet'
  resources :pets
  match '/extravios/nuevo/:id' => "lost_reports#new", as: 'new_lost_report', via: [:get, :post]
  match '/extravios/:id' => "lost_reports#show", as: 'lost_report', via: [:get, :post]  
  resources :lost_reports
  root 'login#index'
end
