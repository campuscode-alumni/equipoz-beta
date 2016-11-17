class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new cust_params
    @customer.save
    redirect_to customer_path(@customer)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private
    def cust_params
      params.require(:customer).permit(:name, :legal_name, :customer_type, :document, :fiscal_number, :contact_name, :phone_number, :email, :address)
    end
end
