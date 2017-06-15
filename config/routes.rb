Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  resources :peliculas
  resources :charges
  resources :settings
  
  
  get '/about' => 'statics#about', :as => :about
  get 'settings/index'
  root :to => 'statics#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
