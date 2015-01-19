Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'incidents#index'

  resources :incidents, :exclude => [:destroy, :edit, :update]

end
