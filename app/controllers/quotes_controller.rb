class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @soat_privates = SoatPrivate.all.group(:vehiculo)
    respond_with(@soat_privates)
  end

  def show
    respond_with(@quote)
  end

  def new
    @quote = Quote.new
    respond_with(@quote)
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.save
    respond_with(@quote)
  end

  def update
    @quote.update(quote_params)
    respond_with(@quote)
  end

  def destroy
    @quote.destroy
    respond_with(@quote)
  end

  private
    def set_quote
      @quote = Quote.find(params[:id])
    end

    def quote_params
      params[:quote]
    end
end
