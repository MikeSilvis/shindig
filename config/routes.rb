Shindig::Application.routes.draw do
  require 'resque/server'
  mount Resque::Server.new, :at => "/resque"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :events do
    resources :menus
    resources :attendees do
      collection do
        get "current"
      end
    end
    resources :messages
    resources :possible_times
    resources :users do
      collection do
        get 'current'
      end
    end
    resources :possible_attendees
    resources :tweets
  end
  resources :restaraunts do
    collection do
      get "search"
    end
  end

  root :to => "home#index"
  get '/sign_in', :to => 'users/sessions#new', :as => :new_session
end
