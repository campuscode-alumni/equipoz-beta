class FinishContractsController < ApplicationController
  before_action :get_contract

  def update
    if @contract.update(finished: true)
      @contract.equipment.update_all(available: true)
      redirect_to contracts_path
    end
  end

  private

  def get_contract
    @contract = Contract.find(params[:id])
  end
end
