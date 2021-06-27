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

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
