Rails.application.routes.draw do
  devise_for :users
  get 'iniciar', to: 'login#index', as: 'login'
  match 'bienvenido' => "main#welcome", as: 'welcome', via: [:get, :post]
  get 'inicio', to: 'main#home', as: 'home'
  get 'breed/:id', to: 'pets#breed_change', as: 'breed_change'
  
  get '/mascotas', to: "pets#index", as: 'pets'
  post '/mascotas', to: "pets#create"
  match '/mascotas/nueva' => "pets#new", as: 'new_pet', via: [:get, :post]
  match "/mascotas/nueva_desaparicion" => "pets#new_lost", as: 'new_lost_pet', via: [:get, :post]
  get '/mascotas/:id/editar', to: 'pets#edit', as: 'edit_pet'
  patch '/mascotas/:id', to: "pets#update" 
  get '/mascotas/:id', to: "pets#show", as: 'pet'

  get '/extravios', to: "lost_reports#index", as: 'lost_reports'
  post '/extravios', to: "lost_reports#create"
  match '/extravios/:id/nuevo' => "lost_reports#new", as: 'new_lost_report', via: [:get, :post]
  get '/extravios/:id/editar', to: "lost_reports#edit", as: 'edit_lost_report'
  patch '/extravios/:id', to: "lost_reports#update"
  get '/extravios/:id', to: "lost_reports#show", as: 'lost_report'
  resources :lost_reports

  root 'login#index'
end
