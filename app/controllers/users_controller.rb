class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user = find_user
  end

  def update
    @user = find_user

    if @user.update(user_params)
      # rubocop:disable Rails/I18nLocaleTexts
      redirect_to users_path, notice: 'User was successfully updated.'
      # rubocop:enable Rails/I18nLocaleTexts
    else
      render :edit
    end
  end

  def destroy
    @user = find_user
    @user.destroy
    sign_out(:user)
    # rubocop:disable Rails/I18nLocaleTexts
    redirect_to new_user_registration_path, notice: 'You logged out.'
    # rubocop:enable Rails/I18nLocaleTexts
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 favorite_food_ids: [])
  end

  def find_user
    User.me(current_user.id, params[:id])
  end
end
