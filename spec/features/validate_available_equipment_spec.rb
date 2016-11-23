require 'rails_helper'

feature 'Validate available equipment' do
  scenario 'when user create contract' do
    category = create(:category)
    equipment_1 = create(:equipment,
                          category: category,
                          description: 'Equipamento 1',
                          available: false)
    equipment_2 = create(:equipment,
                          category: category,
                          description: 'Equipamento 2',
                          available: false)
    available_equipment = create(:equipment,
                                  category: category,
                                  description: 'Equipamento Válido',
                                  available: true)

    visit new_contract_path

    expect(page).to have_content(available_equipment.description)
    expect(page).to_not have_content(equipment_1.description)
    expect(page).to_not have_content(equipment_2.description)
  end
end
