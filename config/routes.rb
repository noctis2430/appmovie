Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'statics/index'

  get 'statics/about'

  get 'peliculas/index'

  root :to => 'statics#index'

  get '/about' => 'statics#about', :as => :about

  resources :peliculas

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
