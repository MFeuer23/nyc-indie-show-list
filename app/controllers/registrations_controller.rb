class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:artist).permit(:name, :bio, :genre, :email, :password, :password_confirmation)
  end
end
