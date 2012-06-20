class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  SERVICES.each do |service|
    define_method "#{service}".to_sym do
      Authentication.send("add_#{service}".to_sym, request.env["omniauth.auth"])
      redirect_to root_url
    end
  end

end