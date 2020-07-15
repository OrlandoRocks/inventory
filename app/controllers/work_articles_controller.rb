class WorkArticlesController < ApplicationController
  before_action :set_work_article, only: [:show, :edit, :update, :destroy]

  # GET /work_articles
  # GET /work_articles.json
  def index
    @search_work_articles = policy_scope(WorkArticle).ransack(params[:q])
    @work_articles = @search_work_articles.result.paginate(page: params[:page], per_page: 20).order(:name)
  end

  # GET /work_articles/1
  # GET /work_articles/1.json
  def show
  end

  # GET /work_articles/new
  def new
    @work_article = WorkArticle.new
  end

  # GET /work_articles/1/edit
  def edit
  end

  # POST /work_articles
  # POST /work_articles.json
  def create
    @work_article = WorkArticle.new(work_article_params)

    respond_to do |format|
      if @work_article.save
        format.html { redirect_to @work_article, notice: t('notifications_masc.success.resource.created',
                                                           resource: t('work_articles.form.resource')) }
        format.json { render :show, status: :created, location: @work_article }
      else
        format.html { render :new }
        format.json { render json: @work_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_articles/1
  # PATCH/PUT /work_articles/1.json
  def update
    respond_to do |format|
      if @work_article.update(work_article_params)
        format.html { redirect_to @work_article, notice: t('notifications_masc.success.resource.updated',
                                                           resource: t('work_articles.form.resource')) }
        format.json { render :show, status: :ok, location: @work_article }
      else
        format.html { render :edit }
        format.json { render json: @work_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_articles/1
  # DELETE /work_articles/1.json
  def destroy
    @work_article.destroy
    respond_to do |format|
      format.html { redirect_to work_articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_article
      @work_article = WorkArticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_article_params
      params.require(:work_article).permit(:name)
    end
end
