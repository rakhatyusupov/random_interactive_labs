class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy, :submit]

  def index
    @articles = Article.published.recent.includes(:user, :tags)
  end

  def show
    authorize @article
  end

  def new
    @article = current_user.articles.build
    authorize @article
  end

  def create
    @article = current_user.articles.build(article_params)
    authorize @article

    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article

    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @article
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  def submit
    authorize @article
    
    if @article.draft?
      @article.update(status: :submitted)
      redirect_to @article, notice: "Article submitted for review."
    else
      redirect_to @article, alert: "Article cannot be submitted."
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :cover_image, tag_names: [])
  end
end
