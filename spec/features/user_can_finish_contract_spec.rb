require 'rails_helper'

feature 'user can finish contract' do
  scenario 'successfully' do
    equipment = create(:equipment, available: true)
    contract = create(:contract, equipment: [equipment])
    create(:delivery_receipt, contract: contract)
    create(:return_receipt, contract: contract)

    visit contracts_path

    click_on contract.id
    click_on 'Finalizar Contrato'

    expect(contracts_path)
    expect(page).to have_css('th', text: 'Status')
    expect(page).to have_content('Finalizado')
  end
end
