require 'rails_helper'

feature 'Validate available equipment' do
  scenario 'when user create contract' do
    equipment_1 = create(:equipment, description: 'Equipamento 1', available: false)
    equipment_2 = create(:equipment, description: 'Equipamento 2', available: false)
    available_equipment = create(:equipment, description: 'Equipamento Válido', available: true)

    visit new_contract_path

    expect(page).to have_content(available_equipment.description)
  end
end
