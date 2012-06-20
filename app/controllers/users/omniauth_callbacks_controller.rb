class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  SERVICES.each do |service|
    define_method "#{service}".to_sym do
      sign_in auth_user(service)
      redirect_to root_url, notice: "Signup successful."
    end
  end

  def auth_user(service)
    Authentication.send("add_#{service}".to_sym, data)
  end

  def data
    request.env["omniauth.auth"]
  end

end