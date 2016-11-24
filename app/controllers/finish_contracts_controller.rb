class FinishContractsController < ApplicationController
  before_action :set_contract

  def update
    if @contract.update(finished: true)
      @contract.equipment.update_all(available: true)
      redirect_to contracts_path
    else
      flash[:error] = 'Não foi possível finalizar o contrato'
      redirect_to contract_path(@contract)
    end
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end
end
