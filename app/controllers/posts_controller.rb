class PostsController < ApplicationController
  def index
    @companies = Company.where(user_id: current_user.id)
    @not_seen_comments = Comment.where(user_id: current_user.id, if_seen: false)
  end

  def newcompany
    @company = Company.new
  end
  
  def createcompany
    @company = Company.new(name: params[:name], user_id: current_user.id)
    if @company.save
      flash[:notice] = "企業の登録が完了しました"
      redirect_to("/posts/index/#{current_user.public_uid}")
    else
      render action: 'newcompany'
    end
  end

  def deletecompany
    @company = Company.find_by(user_id: current_user.id, id: params[:company_id])
    @company.destroy
    flash[:notice] = "削除が完了しました"
    redirect_to("/posts/index/#{current_user.public_uid}")
  end

  def company
    @company = Company.find_by(user_id: current_user.id, id: params[:company_id])
    @posts = Post.where(user_id: current_user.id, company_id: params[:company_id])
    @not_seen_comments = Comment.where(company_id: params[:company_id], user_id: current_user.id, if_seen: false)
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
      redirect_to("/posts/company/#{current_user.public_uid}/#{@company.id}/#{@post.id}")
    else
      render action: 'newes'
    end
  end

  def es
    @user = User.find_by(public_uid: params[:id])
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: current_user.id)
    @comments = Comment.where(post_id: @post.id, company_id: @post.company_id, user_id: current_user.id)
  end

  def ifseenes
    @user = User.find_by(public_uid: params[:id])
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: current_user.id)
    @not_seen_comments = Comment.where(post_id: params[:post_id], company_id: params[:company_id], user_id: current_user.id, if_seen: false)
    for @comment in @not_seen_comments do
      @comment.if_seen = true
      @comment.save
    end
    flash[:notice] = "#{@not_seen_comments.length}件のコメントを既読にしました"
    redirect_to("/posts/company/#{current_user.public_uid}/#{@post.company_id}/#{@post.id}")
  end

  def deletees
    @user = User.find_by(public_uid: params[:id])
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: @user.id)
    @post.destroy
    flash[:notice] = "削除が完了しました"
    redirect_to("/posts/company/#{@user.public_uid}/#{@post.company_id}")
  end

  def edites
    @user = User.find_by(public_uid: params[:id])
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: @user.id)
  end

  def updatees
    @user = User.find_by(public_uid: params[:id])
    @post = Post.find_by(id: params[:post_id], company_id: params[:company_id], user_id: @user.id)
    @post.name = params[:name]
    @post.year_deadline = params[:year_deadline]
    @post.month_deadline = params[:month_deadline]
    @post.day_deadline = params[:day_deadline]
    @post.content = params[:content]
    @post.password = params[:password]
    if @post.save
      flash[:notice] = "ESの編集が完了しました"
      redirect_to("/posts/company/#{current_user.public_uid}/#{@post.company_id}/#{@post.id}")
    else
      render action: 'edites'
    end
  end
end
