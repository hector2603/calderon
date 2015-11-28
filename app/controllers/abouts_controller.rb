class AboutsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :create, :update,:show] 
  before_action :set_about, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @about = About.find(1)
    respond_with(@about)
  end

  def show
    redirect_to abouts_path 
  end

  def new
    @about = About.new
    respond_with(@about)
  end

  def edit
  end

  def create
    @about = About.new(about_params)
    @about.save
    respond_with(@about)
  end

  def update
    @about.update(about_params)
    respond_with(@about)
  end

  def destroy
    @about.destroy
    respond_with(@about)
  end

  private
    def set_about
      @about = About.find(params[:id])
    end

    def about_params
      params.require(:about).permit(:titulo, :texto)
    end
end
