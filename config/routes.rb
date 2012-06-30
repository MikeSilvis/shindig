Shindig::Application.routes.draw do
  require 'resque/server'
  mount Resque::Server.new, :at => "/resque"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :api do
    namespace :v1 do
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
    end
  end

  resources :events, only: [:show, :create] do
    resources :attendees, only: [:new] do
      collection do
        get 'create_attendee'
      end
    end
  end

  root :to => "home#index"
end