class PostsController < ApplicationController
  def index
    @companies = Company.where(user_id: current_user.id)
  end

  def newcompany
    
  end
  
  def createcompany
    @company = Company.new(name: params[:name], user_id: current_user.id)
    #
    if @company.save
      redirect_to("posts/index/#{current_user.id}")
    end
  end

  def company

  end

  def newes

  end
end
