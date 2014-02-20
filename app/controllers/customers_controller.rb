class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end
  def create
    @customer = Customer.new(params[:customer].permit(:name, :mobile, :email, :address))
 
    if @customer.save
      redirect_to @customer
    else
      render 'new'
    end
  end
  def show
    @customer = Customer.find(params[:id])
  end
  def index
    @customers = Customer.all
  end
 
private
  def customer_params
    params.require(:customer).permit(:name, :mobile, :email, :address)
  end
end
