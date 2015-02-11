class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def planningdegarde
    @user = User.from_omniauth(request.env["omniauth.auth"])

    puts request.env["omniauth.auth"].inspect
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
    else
      session["devise.planningdegarde_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end