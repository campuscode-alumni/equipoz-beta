module ContractHelper
  def finish_contract_helper
    return 'Finalizado' if @contract.finished

    link_to('Finalizar Contrato', finish_contract_path(@contract.id),
            method: :put) if @contract.return_receipt
  end

  def return_receipt_helper(contract)
    if contract.return_receipt
      link_to 'Visualizar retorno', return_receipt_contract_path(contract.id)
    else
      link_to 'Emitir Devolução', new_contract_return_receipt_path(contract.id)
    end
  end
end
