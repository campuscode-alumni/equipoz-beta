require 'rails_helper'

feature 'User create a contract' do
  scenario 'successfully' do


    equipment = create(:equipment)
    contract = build(:contract)


    visit new_contract_path

    select contract.customer.name, from: 'Cliente'

    select equipment.category, from: 'Equipamentos'
    select contract.rental_period, from: 'Prazo de Locação'

    fill_in 'Endereço de Entrega', with: contract.delivery_address
    fill_in 'Responsável', with: contract.contact
    select contract.payment_method, from: 'Formas de Pagamento'
    fill_in 'Preço', with: contract.amount
    fill_in 'Desconto', with: contract.discount
    fill_in 'Preço Final', with: contract.total_amount

    click_on 'Gerar Contrato'

    expect(page).not_to have_content('Não foi possível criar contrato')
    expect(page).to have_css('h1', text: contract.customer.name)
    expect(page).to have_content(equipment.category)
    expect(page).to have_content(contract.rental_period)
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(contract.contact)
    expect(page).to have_content(contract.payment_method)
    expect(page).to have_content(contract.amount)
    expect(page).to have_content(contract.discount)
    expect(page).to have_content(contract.total_amount)

  end
  scenario 'unsuccessfully' do
    visit new_contract_path

    click_on 'Gerar Contrato'

    expect(page).to have_current_path(contracts_path)
    expect(page).to have_content('Não foi possível criar contrato')

  end
end
