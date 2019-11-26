class ArticlesController < ApplicationController
  before_action :find_article, except: [:new, :create, :index, :from_author]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update,  :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def edit
    @categories = Category.all
  end

  def update
    @article.update(article_params)
    @article.save_categories

    redirect_to @article
  end

  def new
    @article = Article.new #lo que este metodo hace es crear un articulo vacio
    @categories = Category.all
  end

  def create
    @article = current_user.articles.create(article_params)
    @article.save_categories

    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def from_author
    @user = User.find(params[:user_id])
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, category_elements: [])
  end

end
