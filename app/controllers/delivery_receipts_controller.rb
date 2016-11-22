class DeliveryReceiptsController < ApplicationController
  
  def create
    @delivery_receipt = DeliveryReceipt.create(contract_id: params[:id])

    redirect_to delivery_receipt_contract_path(params[:id])
  end

  def show
    @contract = Contract.find_by(id: params[:id])

    if @contract.nil?
      flash[:error] = 'Contrato inválido'
      redirect_to contracts_path
    else
      @delivery_receipt = @contract.delivery_receipt
    end
  end
end
 