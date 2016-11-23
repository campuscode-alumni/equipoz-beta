require 'rails_helper'

feature 'User visit contracts page' do
  scenario 'successfully' do
    equipment = create(:equipment)

    contract_01 = create(:contract, equipment: [equipment])
    contract_02 = create(:contract, total_amount:450.90, equipment: [equipment])

    visit contracts_path


    expect(page).to have_content('Contratos')
    expect(page).to have_content(contract_01.id)
    expect(page).to have_content(contract_01.customer.name)
    expect(page).to have_content(contract_01.amount)
    expect(page).to have_content(contract_01.discount)
    expect(page).to have_content(contract_01.total_amount)



    expect(page).to have_content(contract_02.id)
    expect(page).to have_content(contract_02.customer.name)
    expect(page).to have_content(contract_02.amount)
    expect(page).to have_content(contract_02.discount)
    expect(page).to have_content(contract_02.total_amount)


  end

  scenario 'empty page' do
    visit contracts_path

    expect(page).to have_content('Não há contratos')
  end
end
