class CommentController < ApplicationController
  def entry
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: params[:user_id])
  end

  def check
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: params[:user_id])
    if params[:password] == @post.password
      redirect_to("/comment/new/#{@post.user_id}/#{@post.company_id}/#{@post.id}")
    else
      render action: 'entry'
    end
  end

  def new
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: params[:user_id])
    @company = Company.find_by(id: params[:company_id], user_id: params[:user_id])
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: params[:user_id])
    @company = Company.find_by(id: params[:company_id], user_id: params[:user_id])
    @user = User.find_by(id: params[:user_id])
    @comment = Comment.new(name: params[:name], comment: params[:comment], content: params[:content], post_id: params[:post_id], user_id: params[:user_id], company_id: params[:company_id])
    if @comment.save
      redirect_to("/comment/finish/#{@user.id}/#{@company.id}/#{@post.id}")
    else
      render action: 'new'
    end
  end

  def finish

  end
end
