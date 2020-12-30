class PostsController < ApplicationController
  def index
    @companies = Company.where(user_id: current_user.id)
  end

  def newcompany
    
  end
  
  def createcompany
    @company = Company.new(name: params[:name], user_id: current_user.id)
    if @company.save
      redirect_to("/posts/index/#{current_user.id}")
    end
  end

  def company
    @company = Company.find_by(user_id: current_user.id, id: params[:company_id])
    @posts = Post.where(user_id: current_user.id, company_id: params[:company_id])
  end

  def newes
    @company = Company.find_by(user_id: current_user.id, id: params[:company_id])
  end

  def createes
    @company = Company.find_by(id: params[:company_id], user_id: current_user.id)
    @post = Post.new(name: params[:name], deadline: params[:deadline], content: params[:content], password: params[:password], company_id: @company.id, user_id: current_user.id)
    if @post.save
      redirect_to("/posts/company/#{current_user.id}/#{@company.id}/#{@post.id}")
    end
  end

  def es
    #@company = Company.find_by(id: params[:company_id], user_id: current_user.id)
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: current_user.id)
    @comment = Comment.where(post_id: params[:post_id])
  end
end
