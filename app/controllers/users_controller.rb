class UsersController < ApplicationController

  prepend_before_action :set_user, only: [:show]
  before_action :get_lost_reports, only: [:show]

  def show; end

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

  def set_user
    @user = User.find(params[:id])
  end

  def get_lost_reports
    @lost_reports = @user.lost_reports
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email
    )
  end
end
