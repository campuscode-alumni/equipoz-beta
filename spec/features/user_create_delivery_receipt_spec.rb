require 'rails_helper'

feature 'user create delivery receipt' do
  scenario 'User visit contract page to create delivery receipt' do
    create(:contract)

    visit contracts_path

    expect(page).to have_content 'Emitir Retirada'
  end

  scenario "User click on 'Emitir' and visit delivery receipt page" do
    contract = create(:contract)

    visit contracts_path

    click_on 'Emitir Retirada'

    expect(page).to have_content('Recibo de Entrega')
    expect(page).to have_content(contract.contact)
    expect(page).to have_content(contract.customer.name)
    expect(page).to have_content(contract.customer.document)

    contract.equipment.each do |ce|
      expect(page).to have_content(ce.full_name)
    end

    expect(page).to have_content(contract.rental_period)
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(
      I18n.l(contract.delivery_receipt.created_at.to_date, format: :long)
    )
    expect(page).to have_content(contract.contract_code)
  end

  scenario 'User visit delivery receipt page of invalid contract' do
    visit delivery_receipt_contract_path(1)

    expect(page).to have_current_path(contracts_path)
    expect(page).to have_content 'Contrato inválido'
  end

  scenario 'User visit contract page to see delivery receipt already exist' do
    contract = create(:contract)
    create(:delivery_receipt, contract: contract)

    visit contracts_path

    expect(page).to have_content 'Visualizar'
  end

  scenario "User click on 'Visualizar' and visit delivery receipt page" do
    contract = create(:contract)
    create(:delivery_receipt, contract: contract)

    visit contracts_path

    click_on 'Visualizar'

    expect(page).to have_content('Recibo de Entrega')
    expect(page).to have_content(contract.contact)
    expect(page).to have_content(contract.rental_period)
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(
      I18n.l(contract.delivery_receipt.created_at.to_date, format: :long)
    )
    expect(page).to have_content(contract.contract_code)
  end
end
