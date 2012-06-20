class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  SERVICES.each do |service|
    define_method "#{service}".to_sym do
      sign_in auth_user(service)
      redirect_to root_url, notice: "#{service.titleize} Registration Successful."
    end
  end

  def auth_user(service)
    User.send("verify_#{service}".to_sym, data)
  end

  def data
    request.env["omniauth.auth"]
  end

end