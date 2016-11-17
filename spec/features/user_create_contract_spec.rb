require 'rails_helper'

feature 'User create a contract' do
  scenario 'successfully' do
    contract = build(:contract)
    visit new_contract_path

    fill_in 'Cliente', with: contract.customer
    fill_in 'Equipamentos', with: contract.equipment
    fill_in 'Prazo de Locação', with: contract.rental_period
    fill_in 'Endereço de Entrega', with: contract.delivery_address
    fill_in 'Responsável', with: contract.contact
    select contract.payment_method, from: 'Formas de Pagamento'
    fill_in 'Preço', with: contract.amount
    fill_in 'Desconto', with: contract.discount
    fill_in 'Preço Final', with: contract.total_amount

    click_on 'Gerar Contrato'

    expect(page).to have_css('h1', text: contract.customer)
    expect(page).to have_content(contract.equipment)
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
