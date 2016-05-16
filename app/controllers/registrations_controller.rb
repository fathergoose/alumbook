class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :current_title, :password, :password_confirmation, :graduation_date, :cohort_id)
  end

end
