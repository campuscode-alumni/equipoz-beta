require 'rails_helper'

feature 'user create delivery receipt' do
  scenario 'User visit contract page to create delivery receipt' do
    contract = create(:contract)

    visit contracts_path

    expect(page).to have_content 'Emitir'
  end

  scenario "User click on 'Emitir' and visit delivery receipt page" do

    contract = create(:contract)

    visit contracts_path

    click_on 'Emitir Retirada'

    expect(page).to have_content('Recibo de Entrega')
    expect(page).to have_content(contract.contact)
    expect(page).to have_content(contract.rental_period)
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(contract.delivery_receipt.created_at)
    expect(page).to have_content(contract.delivery_receipt.contract_id)

  end
end
