class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:edit, :update, :approve, :publish, :unpublish]

  def index
    @articles = Article.all.order(created_at: :desc).includes(:user)
    @pending_articles = Article.where(status: :submitted).recent
  end

  def edit
    # Admin can edit any article
  end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def approve
    if @article.submitted?
      @article.update(status: :published, published_at: Time.current, approved_by: current_user)
      redirect_to admin_articles_path, notice: "Article approved and published."
    else
      redirect_to admin_articles_path, alert: "Only submitted articles can be approved."
    end
  end

  def publish
    @article.update(status: :published, published_at: Time.current, approved_by: current_user)
    redirect_to admin_articles_path, notice: "Article published."
  end

  def unpublish
    @article.update(status: :draft, published_at: nil)
    redirect_to admin_articles_path, notice: "Article unpublished."
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :status, :cover_image, tag_names: [])
  end
end
