# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  #   flash[:redirect]='1'

  #   # redirect_to root
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


  def after_sign_in_path_for(resource)
    if current_user.user_type.upcase=="ADMIN"
      access_date_path
    elsif current_user.user_type.upcase=="CANDIDATE"
      candidate_path(current_user.id)
    else
      interinfo_path(current_user.name)
    end  
  end

end
