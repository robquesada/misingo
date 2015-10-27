class MainController < ApplicationController
  def welcome; end
  def home
    @invite = Invite.new
  end
end
