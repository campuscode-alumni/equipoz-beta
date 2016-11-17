class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      flash.now[:error] = 'Não foi possível criar contrato'
      render :new
    end  
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private
    def contract_params
      params.require(:contract).permit(:customer, :equipment, :rental_period, :delivery_address,
        :contact, :payment_method, :amount, :discount, :total_amount)
    end

end
