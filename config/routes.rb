Shindig::Application.routes.draw do
  require 'resque/server'
  mount Resque::Server.new, :at => "/resque"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :events do
    resources :menus
    resources :attendees
    resources :messages
    resources :possible_times
  end

  resources :users

  resources :restaraunts do
    collection do
      get "search"
    end
  end

  root :to => "home#index"
end
