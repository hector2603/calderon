class SoatPrivatesController < ApplicationController
  before_action :set_soat_private, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :create, :update,:show] 

  respond_to :html, :json

  def index
    if params[:vehiculo]
      if params[:clase]
        @soat_privates = SoatPrivate.where(clase: params[:clase]).where(vehiculo: params[:vehiculo])
      else
        @soat_privates = SoatPrivate.where(vehiculo: params[:vehiculo])
      end
    else
        @soat_privates = SoatPrivate.all
    end
      respond_with(@soat_privates)
  end

  def show
    redirect_to soat_privates_path
  end

  def new
    @soat_private = SoatPrivate.new
    respond_with(@soat_private)
  end

  def edit
  end

  def create
    @soat_private = SoatPrivate.new(soat_private_params)
    @soat_private.save
    respond_with(@soat_private)
  end

  def update
    @soat_private.update(soat_private_params)
    respond_with(@soat_private)
  end

  def destroy
    @soat_private.destroy
    respond_with(@soat_private)
  end

  private
    def set_soat_private
      @soat_private = SoatPrivate.find(params[:id])
    end

    def soat_private_params
      params.require(:soat_private).permit(:vehiculo, :clase, :prima, :contribucion, :tasa)
    end
end
