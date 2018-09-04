class Artists::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @artist = Artist.from_omniauth(request.env["omniauth.auth"])

    if @artist.persisted?
      sign_in_and_redirect @artist, event: :authentication #this will throw if @user is not activated
      redirect_to edit_artist_path(@artist) unless @artist.name
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_artist_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
