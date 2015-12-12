class ContactosController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :destroy, :update,:show] 
  before_action :set_contacto, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @contactos = Contacto.all.order(created_at: :desc)
    respond_with(@contactos)
  end

  def show
    respond_with(@contacto)
  end

  def new
    @contacto = Contacto.new
    respond_with(@contacto)
  end

  def edit
  end

  def create
    @contacto = Contacto.new(contacto_params)
    if @contacto.save
      flash[:notice] = "Se Envió el mensaje correctamente" 
      redirect_to root_path 
    else
      respond_with(@contacto)
    end
  end

  def update
    @contacto.update(contacto_params)
    respond_with(@contacto)
  end

  def destroy
    @contacto.destroy
    respond_with(@contacto)
  end

  private
    def set_contacto
      @contacto = Contacto.find(params[:id])
    end

    def contacto_params
      params.require(:contacto).permit(:nombre, :asunto, :texto, :numero,:email)
    end
end
