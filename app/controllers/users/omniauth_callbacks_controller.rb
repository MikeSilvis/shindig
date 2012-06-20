class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  SERVICES.each do |service|
    define_method "#{service}".to_sym do
      current_user ? create_auth(service) : create_user_and_auth(service)
      redirect_to root_url, notice: "#{service.titleize} Registration Successful."
    end
  end

private

  def create_user_and_auth(service)
    event_token = session[:event_token] if session[:event_token]
    sign_in(User.send("verify_#{service}".to_sym, data).user)
    current_user.attendees.add_event(event_token) if session[:event_token]
  end

  def create_auth(service)
    current_user.authentications.send("find_or_create_#{service}".to_sym, data)
  end

  def data
    request.env["omniauth.auth"]
  end

end