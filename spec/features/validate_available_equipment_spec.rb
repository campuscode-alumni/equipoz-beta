require 'rails_helper'

feature 'Validate available equipment' do
  scenario 'when user create contract' do
    category = create(:category)
    equipment_one = create(:equipment,
                           category: category,
                           description: 'Equipamento 1',
                           available: false)
    equipment_two = create(:equipment,
                           category: category,
                           description: 'Equipamento 2',
                           available: false)
    available_equipment = create(:equipment,
                                 category: category,
                                 description: 'Equipamento Válido',
                                 available: true)

    visit new_contract_path

    expect(page).to have_content(available_equipment.description)
    expect(page).to_not have_content(equipment_one.description)
    expect(page).to_not have_content(equipment_two.description)
  end

  scenario 'when user finish contract' do
    category = create(:category)
    equipment = create(:equipment,
                       category: category,
                       description: 'Equipamento 1',
                       available: true)
    contract = create(:contract, finished: false, equipment: [equipment])
    create(:delivery_receipt, contract: contract)
    create(:return_receipt, contract: contract)

    visit contract_path(contract)

    click_on 'Finalizar Contrato'

    visit new_contract_path

    expect(page).to have_content(equipment.description)
  end

  scenario 'user try create contract with a unavailable equipment' do
    category = create(:category)
    equipment = create(:equipment,
                       category: category,
                       description: 'Equipamento 1',
                       available: true)

    visit new_contract_path

    check equipment.full_name

    equipment.update(available: false)

    click_on 'Gerar Contrato'

    expect(page).to have_content('Equipamentos em uso')
    expect(page).to have_content(equipment.full_name)
  end
end
