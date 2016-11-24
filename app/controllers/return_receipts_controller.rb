class ReturnReceiptsController < ApplicationController
  def show
    @contract = Contract.find params[:id]
  end

  def new
    @contract = Contract.find params[:contract_id]
    @return_receipt = ReturnReceipt.new
  end

  def create
    @contract = Contract.find params[:contract_id]

    @return_receipt = @contract.build_return_receipt(return_params)

    if @return_receipt.save
      redirect_to return_receipt_contract_path(@contract)
    else
      flash.now[:error] = 'Não é possível criar o recibo de devolução'
      render :new
    end
  end

  private

  def return_params
    params.require(:return_receipt).permit(:employee, :document)
  end
end
