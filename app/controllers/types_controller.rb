class TypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :create, :update,:show] 
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @types = Type.all
    respond_with(@types)
  end

  def show
    respond_with(@type)
  end

  def new
    @type = Type.new
    respond_with(@type)
  end

  def edit
  end

  def create
    @type = Type.new(type_params)
    @type.save
    flash[:notice] = "Se creo exitosamente el tipo" 
    redirect_to types_path 
  end

  def update
    @type.update(type_params)
    flash[:notice] = "Se edito exitosamente el tipo" 
    redirect_to types_path 
  end

  def destroy
    @type.destroy
    respond_with(@type)
  end

  private
    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:nombre)
    end
end
