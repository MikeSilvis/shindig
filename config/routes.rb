Shindig::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :events do
    resource :attend
    resources :messages
  end

  root :to => "home#index"
end
