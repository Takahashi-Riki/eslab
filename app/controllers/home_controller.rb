class HomeController < ApplicationController
  before_action :authenticate_user!
  def top
    @user = User.find_by(id: current_user.id)
  end

  def about
  end
end
