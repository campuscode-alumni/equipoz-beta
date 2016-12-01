class ContractPricesController < ApplicationController
  before_action :set_contract

  def edit
  end

  def update
    redirect_to contract_path(@contract.id) if @contract.update(contract_params)
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.permit(:discount)
  end
end
