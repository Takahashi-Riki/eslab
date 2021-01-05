class HomeController < ApplicationController
  before_action :authenticate_user!
  def top
    @user = User.find_by(id: current_user.id)
    @not_seen_comments = Comment.where(user_id: current_user.id, if_seen: false)
  end

  def privacy
    
  end
end
