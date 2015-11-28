class BuscarsController < ApplicationController
  before_action :set_buscar, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:busqueda]
      @articles = Article.search(params[:busqueda]).order(created_at: :desc)
      @services = Service.search(params[:busqueda])
      @insurances = Insurance.search(params[:busqueda])
      respond_with(@articles,@services,@insurances)
    else 
      @articles = Article.all.order(created_at: :desc)
      @services = Service.all
      @insurances = Insurance.all
      respond_with(@articles,@services,@insurances)
    end

  end

  
  private
    def set_buscar
      @buscar = Buscar.find(params[:id])
    end

    def buscar_params
      params[:buscar]
    end
end
