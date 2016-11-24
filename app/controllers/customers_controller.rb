class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new cust_params
    if @customer.save
      redirect_to customer_path(@customer)
    else
      flash[:msg] = 'Não foi possível cadastrar o cliente'
      flash[:name] = 'todo'
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private

  def cust_params
    params.require(:customer).permit(
      :name, :legal_name, :customer_type, :document,
      :fiscal_number, :contact_name, :phone_number, :email, :address
    )
  end
end
