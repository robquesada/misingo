class InvitesController < ApplicationController
  def create
    invite = Invite.new(invite_params)
    if invite.save
      redirect_to root_path, notice: "Gracias por colaborar con Misingo"
    else
      flash[:error] = invite.errors
      redirect_to root_path
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email, :comment)
  end
end
