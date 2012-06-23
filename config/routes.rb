Shindig::Application.routes.draw do
  require 'resque/server'
  mount Resque::Server.new, :at => "/resque"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :events do
    resource :attend
    resources :messages
  end
  resources :restaraunts, only: [:index]
  root :to => "home#index"
end
