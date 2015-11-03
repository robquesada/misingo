class MainController < ApplicationController
  def home
    @invite = Invite.new
  end
  def contact; end
end
