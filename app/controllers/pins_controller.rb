class PinsController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all
    respond_with(@pin)
  end

  def show
    respond_with(@pin)
  end

  def new
    @pin = Pin.new
    respond_with(@pin)
  end

  def edit
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @pin.update(pin_params)
    respond_with(@pin)
  end

  def destroy
    @pin.destroy
    respond_with(@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description)
    end
end
