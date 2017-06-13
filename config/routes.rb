Rails.application.routes.draw do
  
  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  get 'settings/index'
  get 'statics/index'

  get 'statics/about'

  get 'peliculas/index'

  get '/about' => 'statics#about', :as => :about

  resources :peliculas
  resources :settings

  root :to => 'statics#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
