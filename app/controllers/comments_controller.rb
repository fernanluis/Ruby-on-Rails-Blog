class CommentsController < ApplicationController
  before_action :find_comment, except: [:new, :create, :index]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @comment = Comment.all
  end

  def edit
    @comment = Comment.new
  end

  def update
    @comment.update(article_params)
    @comment.save

    redirect_to @comment
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.find(params[:article_id])
    @comment = @article.comments.create(comments_params)

    redirect_to @comment
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:commenter, :body)
  end

end
