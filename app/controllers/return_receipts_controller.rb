class ReturnReceiptsController < ApplicationController

  def show
  end

  def new
    @contract = Contract.find params[:contract_id]
    @return_receipt = ReturnReceipt.new
  end

  def create
    @contract = Contract.find params[:contract_id]
    @return_receipt = ReturnReceipt.new return_params
    @return_receipt.save
    render :show
  end

  private

  def return_params
    params.require(:return_receipt).permit(:employee, :document)
  end
end
