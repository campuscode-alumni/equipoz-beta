module ContractHelper
  def finish_contract_helper
    return 'Finalizado' if @contract.finished

    link_to('Finalizar Contrato', contract_path(contract: { 
      id: @contract.id,
      finished: true
    }), method: :put) if @contract.return_receipt
  end
end
