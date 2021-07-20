class ArticlesController < ApplicationController
  before_action :authorized, only: [:new]

  def index
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    if logged_in?
      @article = Article.new(article_params)

      if @article.save
        redirect_to @article
      else
        render :new
      end
    else
      redirect_to '/'
    end
  end

  def delete
    if logged_in? and is_admin?
      @article = Article.find_by(id: params[:id])
      if @article
        @article.destroy
      end
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
