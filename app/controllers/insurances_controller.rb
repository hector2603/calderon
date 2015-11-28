class InsurancesController < ApplicationController
  before_action :set_insurance, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :create, :update]

  respond_to :html

  def index
    @insurances = Insurance.all
    respond_with(@insurances)
  end

  def show
    respond_with(@insurance)
  end

  def new
    @insurance = Insurance.new
    respond_with(@insurance)
  end

  def edit
  end

  def create
    @insurance = Insurance.new(insurance_params)
    @insurance.save
    respond_with(@insurance)
  end

  def update
    @insurance.update(insurance_params)
    respond_with(@insurance)
  end

  def destroy
    @insurance.destroy
    respond_with(@insurance)
  end

  private
    def set_insurance
      @insurance = Insurance.find(params[:id])
    end

    def insurance_params
      params.require(:insurance).permit(:nombre, :resumen, :descripcion)
    end
end
