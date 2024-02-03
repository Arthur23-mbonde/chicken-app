class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters

      #devise_parameter_sanitizer.permit(:sign_up, keys: %i[role, first_name, last_name, age, sex, country, city, phone, address, email, password, password_confirmation ])
      #devise_parameter_sanitizer.permit(:account_update, keys: %i[role, first_name, last_name, age, sex, country, city, phone, address, email, password, password_confirmation, :photo ])

      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :last_name, :first_name, :age, :sex, :country, :city, :phone, :address, :email, :password, :password_confirmation, :photo) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :last_name, :first_name, :age, :sex, :country, :city, :phone, :address, :email, :password, :password_confirmation, :current_password, :photo) }


    end
end
