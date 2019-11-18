class ArticlesController < ApplicationController
  before_action :find_article, except: [:new, :create, :index, :from_author]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update,  :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  def update
    @article.update(title: params[:article][:title],content: params[:article][:content])

    redirect_to @article
  end

  def new
    @article = Article.new #lo que este metodo hace es crear un articulo vacio
  end

  def create
    @article = current_user.articles.create(title: params[:article][:title],
                              content: params[:article][:content])
    redirect_to @article
  end

  def destoy
    @article.destroy
    redirect_to root_path
  end

  def from_author
    @user = User.find(params[:user_id])
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
