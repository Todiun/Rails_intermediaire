Rails.application.routes.draw do
  
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get 'home', to: 'static_pages#home'
  get 'welcome/:first_name', to: 'static_pages#welcome', as: 'welcome'
  resources :gossips, only: [:show, :new, :create]
  resources :users, only: [:show]
  # La page d'accueil du site
  root 'static_pages#home'
end
