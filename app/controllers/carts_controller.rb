class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show
    @cart= Cart.find(params[:id])
  end

  def new
    @cart = Cart.new
  end

  def edit
    @cart=  Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart.update(cart_params)
  end
def destroy
    @cart.destroy if @cart.id == session[:cart_id]
session[:cart_id] = nil
respond_to do |format|
format.html { redirect_to store_url }
format.json { head :no_content }
end
end
  private
    def set_cart
      @cart = Cart.find(params[:id])
      def invalid_cart
logger.error "Attempt to access invalid cart #{params[:id]}"
redirect_to store_url, notice: 'Invalid cart'
    end
   end
    def cart_params
      params[:cart]
    end
end
