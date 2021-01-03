class CommentController < ApplicationController
  def entry
    @user = User.find_by(public_uid: params[:id])
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: @user.id)
  end

  def check
    @user = User.find_by(public_uid: params[:id])
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: @user.id)
    if params[:password] == @post.password
      redirect_to("/comment/new/#{@user.public_uid}/#{@post.company_id}/#{@post.id}")
    else
      render action: 'entry'
    end
  end

  def new
    @user = User.find_by(public_uid: params[:id])
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: @user.id)
    @company = Company.find_by(id: params[:company_id], user_id: @user.id)
  end

  def create
    @user = User.find_by(public_uid: params[:id])
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: @user.id)
    @company = Company.find_by(id: params[:company_id], user_id: @user.id)
    @comment = Comment.new(name: params[:name], comment: params[:comment], content: params[:content], post_id: params[:post_id], user_id: @user.id, company_id: params[:company_id])
    if @comment.save
      CommentMailer.send_when(@user).deliver
      redirect_to("/comment/finish/#{@user.id}/#{@company.id}/#{@post.id}")
    else
      render action: 'new'
    end
  end

  def finish

  end
end
