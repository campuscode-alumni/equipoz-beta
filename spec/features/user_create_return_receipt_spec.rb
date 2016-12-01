require 'rails_helper'

feature 'User create return receipt' do
  scenario 'successfully' do
    contract = create(:contract)
    create(:delivery_receipt, contract: contract)
    return_receipt = build(:return_receipt)

    visit contracts_path

    click_on 'Emitir Devolução'

    fill_in 'Funcionario', with: return_receipt.employee
    fill_in 'Documento', with: return_receipt.document

    click_on 'Emitir Devolução'

    expect(page).to have_content return_receipt.employee
    expect(page).to have_content return_receipt.document
  end

  scenario 'user view return receipt data' do
    contract = create(:contract)
    delivery_receipt = create(:delivery_receipt, contract: contract)
    return_receipt = create(:return_receipt, contract: contract)

    visit return_receipt_contract_path(id: contract.id)

    expect(page).to have_content(
      I18n.l(return_receipt.created_at.to_date, format: :long)
    )
    expect(page).to have_content return_receipt.employee
    expect(page).to have_content return_receipt.document
    contract.equipment.each do |ce|
      expect(page).to have_content(ce.full_name)
    end
    expect(page).to have_content(contract.contract_code)
    expect(page).to have_content(contract.customer.name)
    expect(page).to have_content(contract.customer.document)
    expect(page).to have_content(
      I18n.l(delivery_receipt.created_at.to_date, format: :long)
    )
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
    create(:return_receipt, contract: contract)

    contract.save

    visit contracts_path

    expect(page).to have_content('Visualizar retorno')
  end
end
