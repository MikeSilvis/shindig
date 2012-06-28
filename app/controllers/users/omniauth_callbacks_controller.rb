class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  SERVICES.each do |service|
    define_method "#{service}".to_sym do
      # location = redirect_location(session[:redirect_url])
      current_user ? create_auth(service) : verify_user_and_auth(service)
      redirect_to root_url, notice: "#{service.titleize} Registration Successful."
    end
  end

private

  def redirect_location(redirect_url)
    redirect_url || root_url
  end

  def verify_user_and_auth(service)
    sign_in(User.send("verify_#{service}".to_sym, data).user)
  end

  def create_auth(service)
    current_user.update_attributes(User.send("#{service}_hash".to_sym, data["info"]))
    current_user.authentications.send("find_or_create_#{service}".to_sym, data)
  end

  def data
    request.env["omniauth.auth"]
  end

end