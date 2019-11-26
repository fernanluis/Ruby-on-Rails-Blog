class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit

  end

  def update
    current_user.update(user_params)

    redirect_back(fallback_location: root_path)
  end

  def user_params
    params.require(:user).permit(:avatar)
  end
end
