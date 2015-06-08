class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  def index
    @line_items = LineItem.all
  end
  def show
    @line_item = Line_item.find(params[:id])
  end
  def new
    @line_item = LineItem.new
  end
  def edit
    @line_item = Line_item.find(params[:id])
  end
def create
product = Product.find(params[:product_id])
@line_item = @cart.add_product(product.id)
respond_to do |format|
if @line_item.save
format.html { redirect_to @line_item.cart }
format.json { render action: 'show',
status: :created, location: @line_item }
else
format.html { render action: 'new' }
format.json { render json: @line_item.errors,
status: :unprocessable_entity }
end
end
end
  def update
    @line_item.update(line_item_params)
  end
  def destroy
    @line_item.destroy
  end
  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end
before_action :set_cart, only: [:create]
# GET /line_items
#...
end
    def line_item_params
params.require(:line_item).permit(:product_id)
end
def set_cart
@cart = Cart.find(session[:cart_id])
rescue ActiveRecord::RecordNotFound
@cart = Cart.create
session[:cart_id] = @cart.id
end