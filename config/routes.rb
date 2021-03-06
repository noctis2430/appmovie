Rails.application.routes.draw do
  
  get 'payment_select/select_plan'

  get 'payment_select/select_monthly_subscription'

  get 'select_movies/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  resources :peliculas
  resources :charges
  resources :settings
  resources :select_movies, only: :index
  get '/select_plan' => 'payment_select#select_plan', as: :select_plan
  get '/select_monthly_subscription' => 'payment_select#select_monthly_subscription', as: :select_monthly_subscription
  
  get '/about' => 'statics#about', :as => :about
  get 'settings/index'
  root :to => 'statics#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
