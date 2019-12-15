class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comments_params)

    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = article.comments.find(params[:id])
    @comment.destroy

    redirect_to @rticles
  end

  def comments_params
    params.require(:comment).permit(:commenter, :body)
  end

end
