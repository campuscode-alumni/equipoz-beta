require 'rails_helper'

feature 'User visit contracts page' do
  scenario 'successfully' do
    equipment = create(:equipment)

    contract_one = create(:contract,
                          equipment: [equipment])
    contract_two = create(:contract,
                          total_amount: 450.90, equipment: [equipment])

    visit contracts_path

    expect(page).to have_content('Contratos')
    expect(page).to have_content(contract_one.id)
    expect(page).to have_content(contract_one.customer.name)
    expect(page).to have_content(contract_one.amount)
    expect(page).to have_content(contract_one.discount)
    expect(page).to have_content(contract_one.total_amount)

    expect(page).to have_content(contract_two.id)
    expect(page).to have_content(contract_two.customer.name)
    expect(page).to have_content(contract_two.amount)
    expect(page).to have_content(contract_two.discount)
    expect(page).to have_content(contract_two.total_amount)
  end

  scenario 'empty page' do
    visit contracts_path

    expect(page).to have_content('Não há contratos')
  end
end
