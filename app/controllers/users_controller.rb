class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :required_permission, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    sign_out(:user)
    redirect_to new_user_registration_path, notice: "You logged out."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 favorite_food_ids: [])
  end

  def required_permission
    redirect_to users_path, notice: "You don't have a permission!" if params[:id].to_i != current_user.id
  end
end
