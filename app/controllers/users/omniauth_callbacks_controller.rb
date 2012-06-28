class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  SERVICES.each do |service_provider|
    define_method service_provider do
      location = redirect_location(session[:redirect_url])
      current_user ? create_auth(service_provider) : verify_user_and_auth(service_provider)
      redirect_to location, notice: "#{service_provider.titleize} Registration Successful."
    end
  end

private

  def redirect_location(redirect_url)
    redirect_url || root_url
  end

  def verify_user_and_auth(service_provider)
    sign_in(User.send("verify_#{service_provider}".to_sym, data).user)
  end

  def create_auth(service_provider)
    current_user.update_attributes(User.send("#{service_provider}_hash".to_sym, data["info"]))
    current_user.authentications.send("find_or_create_#{service_provider}".to_sym, data)
  end

  def data
    request.env["omniauth.auth"]
  end

end