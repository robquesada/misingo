class UsersController < ApplicationController
  def index
    @lost_reports = current_user.lost_reports
  end
end
