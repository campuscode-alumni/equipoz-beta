require 'rails_helper'

feature 'User create a contract' do
  scenario 'visiting #new' do
    visit root_path
    click_on 'Painel Administrativo'
    click_on 'Novo Contrato'
    expect(new_contract_path)
  end

  scenario 'successfully' do
    contract = build(:contract)
    equipment = []
    equipment << Equipment.first

    visit new_contract_path

    fill_form(contract, equipment)

    click_on 'Gerar Contrato'

    expect(page).not_to have_content('Não foi possível criar contrato')
    expect(page).to have_css('h1', text: contract.customer.name)
    expect(page).to have_content(equipment.first.description)
    expect(page).to have_content(contract.rental_period)
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(contract.contact)
    expect(page).to have_content(contract.payment_method)
    expect(page).to have_content(contract.discount)
  end
  scenario 'unsuccessfully' do
    visit new_contract_path

    click_on 'Gerar Contrato'

    expect(page).to have_current_path(contracts_path)
    expect(page).to have_content('Não foi possível criar contrato')
  end

  scenario 'change equipment status' do

    equipment = create_list(:equipment, 2, available: true)
    contract = build(:contract, equipment: equipment)

    visit new_contract_path

    fill_form(contract, equipment)

    click_on 'Gerar Contrato'

    visit new_contract_path

    expect(page).to_not have_content(equipment.first.description)
  end


  scenario 'and view amount calculated' do
    category_amount = create(:category_amount, amount: 600)
    valor = 1200
    equipment = create_list(:equipment, 2, category: category_amount.category)
    contract = build(:contract, equipment: equipment)

    visit new_contract_path

    fill_form(contract, equipment)

    click_on 'Gerar Contrato'

    expect(page).to have_content("Valor: #{valor}")
  end

  scenario 'and view total_amount calculated with discount' do
    category_amount = create(:category_amount, amount: 600)
    equipment = create_list(:equipment, 2, category: category_amount.category)
    total = 1100

    contract = build(:contract, equipment: equipment, discount: 100)

    visit new_contract_path

    fill_form(contract, equipment)

    click_on 'Gerar Contrato'

    expect(page).to have_content("Total: #{total}")
  end

  private

    def fill_form(contract, equipment)
      fill_in_form(contract)
      select_form(contract, equipment)
    end

    def fill_in_form(contract)
      fill_in 'Endereço de Entrega', with: contract.delivery_address
      fill_in 'Responsável', with: contract.contact
      fill_in 'Desconto', with: contract.discount
    end

    def select_form(contract, equipment)
      select contract.customer.name, from: 'Cliente'
      equipment.each do |equipment|
        select equipment.description, from: 'Equipamentos'
      end
      select contract.rental_period, from: 'Prazo de Locação'
      select contract.payment_method, from: 'Formas de Pagamento'
    end
end
