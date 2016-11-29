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

  scenario 'change equipment status' do

    equipment = []
    equipment << create(:equipment, available: true)
    contract = build(:contract, equipment: [equipment.first])

    visit new_contract_path

    fill_form(contract, equipment)

    click_on 'Gerar Contrato'

    visit new_contract_path

    expect(page).to_not have_content(equipment.first.description)
  end


  scenario 'and view amount calculated' do

    category_amount = create(:category_amount)
    equipment_one = create(:equipment, category: Category.first)
    equipment_two = create(:equipment, category: Category.first)

    contract = build(:contract, equipment: [equipment_one, equipment_two])

    amount_one = equipment_one.category_amounts
      .find_by(rental_period: contract.rental_period).amount

    amount_two = equipment_two.category_amounts
      .find_by(rental_period: contract.rental_period).amount

    valor = amount_one + amount_two

    equipment = [equipment_one, equipment_two]

    visit new_contract_path

    fill_form(contract, equipment)

    click_on 'Gerar Contrato'

    expect(page).to have_content("Valor: #{valor}")
  end

  scenario 'and view total_amount calculated with discount' do

    category_amount = create(:category_amount)
    equipment_one = create(:equipment, category: Category.first)
    equipment_two = create(:equipment, category: Category.first)

    contract = build(:contract, equipment: [equipment_one, equipment_two])

    amount_one = equipment_one.category_amounts
      .find_by(rental_period: contract.rental_period).amount

    amount_two = equipment_two.category_amounts
      .find_by(rental_period: contract.rental_period).amount

    valor = amount_one + amount_two
    total = valor - contract.discount

    equipment = [equipment_one, equipment_two]

    visit new_contract_path

    fill_form(contract, equipment)

    click_on 'Gerar Contrato'

    expect(page).to have_content("Valor: #{valor}")
    expect(page).to have_content("Total: #{total}")
  end

  private

  private

    def fill_form(contract, equipment)
      fill_in_form(contract)
      select_form(contract, equipment)
    end

    def fill_in_form(contract)
      fill_in 'Endereço de Entrega', with: contract.delivery_address
      fill_in 'Responsável', with: contract.contact
      fill_in 'Preço', with: contract.amount
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
