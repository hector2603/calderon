class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :create, :update] 
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @articles = Article.all.order(created_at: :desc)
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
    flash[:notice] = "Se creo exitosamente el Artículo" 
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    flash[:notice] = "Se edito exitosamente el Artículo"
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:titulo, :resumen, :body, :cover,:markup_body)
    end
end
