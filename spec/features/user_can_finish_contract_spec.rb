require 'rails_helper'

feature 'user can finish contract' do
  scenario 'successfully' do
    equipment = create(:equipment, available: false)
    contract = create(:contract, equipment: [equipment])
    delivery_receipt = create(:delivery_receipt, contract: contract)
    return_receipt = create(:return_receipt, contract: contract)

    visit contracts_path

    click_on contract.id
    click_on 'Finalizar Contrato'

    expect(contracts_path)
    expect(page).to have_css('th', text: 'Status')
    expect(page).to have_content('Finalizado')
  end
end
