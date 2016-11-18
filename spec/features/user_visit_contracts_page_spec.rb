require 'rails_helper'

feature 'User visit contracts page' do
  scenario 'successfully' do

    contract_01 = create(:contract)
    contract_02 = create(:contract, total_amount:450.90)

    visit contracts_path

    expect(page).to have_content('Contratos')
    expect(page).to have_content(contract_01.equipment)
    expect(page).to have_content(contract_01.rental_period)
    expect(page).to have_content(contract_01.delivery_address)
    expect(page).to have_content(contract_01.contact)
    expect(page).to have_content(contract_01.payment_method)
    expect(page).to have_content(contract_01.amount)
    expect(page).to have_content(contract_01.discount)
    expect(page).to have_content(contract_01.total_amount)

    expect(page).to have_content(contract_02.equipment)
    expect(page).to have_content(contract_02.rental_period)
    expect(page).to have_content(contract_02.delivery_address)
    expect(page).to have_content(contract_02.contact)
    expect(page).to have_content(contract_02.payment_method)
    expect(page).to have_content(contract_02.amount)
    expect(page).to have_content(contract_02.discount)
    expect(page).to have_content(contract_02.total_amount)

  end

  scenario 'empty page' do
    visit contracts_path

    expect(page).to have_content('Não há contratos')
  end
end
