class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # before_action :authenticate_user!

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  #   def verified_request?
  #     super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  #   end

  #   private

  #   def set_csrf_cookie_for_ng
  #     cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  #   end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :email, :password, :current_title, :current_employer, :graduation_date, :cohort_id, :user_type, :phone)
  end
end
