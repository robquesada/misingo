class UsersController < ApplicationController

  prepend_before_action :find_user, only: [:show]

  def show
    @pet_reports = @user.adoptions + @user.lost_reports
  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      flash.now[:error] = current_user.errors.messages
      render 'edit'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email
    )
  end
end
