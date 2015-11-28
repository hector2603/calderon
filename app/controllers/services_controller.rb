class ServicesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :create, :update] 
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:tipo_id]
      @types = Type.find(params[:tipo_id])
      @tipos_barra = Type.all
      @services = Service.where(type_id: params[:tipo_id]).order(:type_id)
      respond_with(@services,@types,@tipos_barra)
    else 
      redirect_to types_path
    end
  end

  def show
    @tipos_barra = Type.all
    respond_with(@service,@tipos_barra)
  end

  def new
    @types = Type.all
    @service = Service.new
    respond_with(@service,@types)
  end

  def edit
    @types = Type.all
    respond_with(@types)
  end

  def create
    @service = Service.new(service_params)
    @service.save
    flash[:notice] = "Se creo exitosamente el servicio" 
    respond_with(@service)
  end

  def update
    @service.update(service_params)
    flash[:notice] = "Se edito exitosamente el servicio" 
    respond_with(@service)
  end

  def destroy
    @service.destroy
    respond_with(@service)
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:type_id, :nombre, :resumen, :descripcion, :metafora)
    end
end
