require 'rails_helper'

feature 'User select equipment' do

  scenario 'and view amount calculated' do
    contract = build(:contract)

    equipment_one = Equipment.first
    amount_one = equipment_one.category_amounts
      .find_by(rental_period: contract.rental_period).amount

    equipment_two = Equipment.last
    amount_two = equipment_one.category_amounts
      .find_by(rental_period: contract.rental_period).amount

    valor = amount_one + amount_two

    equipment = [equipment_one, equipment_two]

    visit new_contract_path

    fill_form(contract, equipment)

    click_on 'Gerar Contrato'

    expect(page).to have_content("Valor: #{valor}")
  end

  scenario 'and view total_amount calculated with discount' do
    contract = build(:contract)

    equipment_one = Equipment.first
    amount_one = equipment_one.category_amounts
      .find_by(rental_period: contract.rental_period).amount

    equipment_two = Equipment.last
    amount_two = equipment_one.category_amounts
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
