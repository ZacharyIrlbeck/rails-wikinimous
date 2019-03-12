class ArticlesController < ApplicationController

  before_action :select, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(parse_params)
    @article.save

    redirect_to '/articles'
  end

  def edit
  end

  def update
    @article.update(parse_params)
    redirect_to '/articles'
  end

  def destroy
    @article.destroy

    redirect_to '/articles'
  end

  private

  def select
    @article = Article.find(params[:id])
  end

  def parse_params
    params.require(:article).permit(:title, :content)
  end
end
