class DeliveryReceiptsController < ApplicationController
  
  def create
    @delivery_receipt = DeliveryReceipt.create(contract_id: params[:id])

    redirect_to delivery_receipt_contract_path(params[:id])
  end

  def show
    @contract = Contract.find(params[:id])
    @delivery_receipt = @contract.delivery_receipt
  end
end
 