class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]


  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :password])
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "Konto zostało zaktualizowane."
      redirect_to root_path
    else
      render "edit"
    end
  end
  def create
    super do |resource|
      UserMailer.welcome_email(resource).deliver_now
    end
  end
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone)
  end
end
