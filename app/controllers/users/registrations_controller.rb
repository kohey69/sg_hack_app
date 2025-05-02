class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[
      plan_id name postal_code prefecture city address_line1 address_line2 phone_number
    ])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[
      plan_id delivery_schedule_type name plan_id name postal_code prefecture city address_line1 address_line2 phone_number
    ])
  end
end
