require 'rails_helper'

feature 'User create return receipt' do
  scenario 'successfully' do
    return_receipt = ReturnReceipt.new(employee: 'João',
                                       document: '123')
    create(:contract)

    visit contracts_path

    click_on 'Emitir Retirada'

    visit contracts_path

    click_on 'Emitir Devolução'

    fill_in 'Funcionario', with: return_receipt.employee
    fill_in 'Documento', with: return_receipt.document

    click_on 'Emitir Devolução'

    expect(page).to have_content return_receipt.employee
    expect(page).to have_content return_receipt.document
  end

  scenario 'unsuccessfully' do
    create(:contract)

    visit contracts_path

    click_on 'Emitir Retirada'

    visit contracts_path

    click_on 'Emitir Devolução'

    fill_in 'Funcionario', with: ''
    fill_in 'Documento', with: ''

    click_on 'Emitir Devolução'

    expect(page).to have_content 'Não é possível criar o recibo de devolução'
  end

  scenario 'already been created' do
    contract = create(:contract)

    create(:delivery_receipt, contract: contract)

    contract.return_receipt = ReturnReceipt.new(employee: 'João',
                                                document: '123')

    contract.save

    visit contracts_path

    expect(page).to have_content('Visualizar retorno')
  end
end
