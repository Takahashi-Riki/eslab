class PostsController < ApplicationController
  def index
    @companies = Company.where(user_id: current_user.id)
  end

  def newcompany
    @company = Company.new
  end
  
  def createcompany
    @company = Company.new(name: params[:name], user_id: current_user.id)
    if @company.save
      flash[:notice] = "企業の登録が完了しました"
      redirect_to("/posts/index/#{current_user.id}")
    else
      render action: 'newcompany'
    end
  end

  def company
    @company = Company.find_by(user_id: current_user.id, id: params[:company_id])
    @posts = Post.where(user_id: current_user.id, company_id: params[:company_id])
  end

  def newes
    @company = Company.find_by(user_id: current_user.id, id: params[:company_id])
    @post = Post.new
  end

  def createes
    @company = Company.find_by(id: params[:company_id], user_id: current_user.id)
    @post = Post.new(name: params[:name], content: params[:content], password: params[:password], company_id: @company.id, user_id: current_user.id, year_deadline: params[:year_deadline], month_deadline: params[:month_deadline], day_deadline: params[:day_deadline])
    if @post.save
      flash[:notice] = "ESの登録が完了しました"
      redirect_to("/posts/company/#{current_user.id}/#{@company.id}/#{@post.id}")
    else
      render action: 'newes'
    end
  end

  def es
    @user = User.find_by(id: params[:user_id])
    @company = Company.find_by(id: params[:company_id], user_id: params[:user_id])
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: current_user.id)
    @comments = Comment.where(post_id: params[:post_id])
  end
end
