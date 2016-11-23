module ContractHelper
  def finish_contract_helper
    return 'Finalizado' if @contract.finished

    link_to('Finalizar Contrato', finish_contract_path(@contract.id),
      method: :put) if @contract.return_receipt
  end
end
