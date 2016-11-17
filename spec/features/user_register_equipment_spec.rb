require 'rails_helper'

feature 'User register tools' do 
	scenario 'successfully access the register page' do

		visit new_equipment_path

		expect(page).to have_css('h1', text:'Cadastro de Equipamentos')
	end

  scenario 'and register a new equipment with success' do
    equipment = Equipment.new(
      category: 'Furadeira',
      serial_number: '12345678',
      acquisition_date: Time.now.to_datetime,
      replacement_value: 12.45,
      usage_limit: 2,
      description: 'Super potente'
    )

    visit new_equipment_path

    fill_in 'Categoria', with: equipment.category
    fill_in 'Número de Serie', with: equipment.serial_number
    fill_in 'Data de Aquisição', with: equipment.acquisition_date
    fill_in 'Valor de Reposição', with: equipment.replacement_value
    fill_in 'Limite de Uso', with: equipment.usage_limit
    fill_in 'Descrição', with: equipment.description
    

    click_button 'Cadastrar Equipamento'

    expect(page).to have_content equipment.category
    expect(page).to have_content equipment.serial_number
    expect(page).to have_content equipment.acquisition_date
    expect(page).to have_content equipment.replacement_value
    expect(page).to have_content equipment.usage_limit
    expect(page).to have_content equipment.description 
  end

  scenario 'and user try to register equipment with empty values' do

    equipment = Equipment.new

    visit new_equipment_path

    fill_in 'Categoria', with: equipment.category
    fill_in 'Número de Serie', with: equipment.serial_number
    fill_in 'Data de Aquisição', with: equipment.acquisition_date
    fill_in 'Valor de Reposição', with: equipment.replacement_value
    fill_in 'Limite de Uso', with: equipment.usage_limit
    fill_in 'Descrição', with: equipment.description

    click_button 'Cadastrar Equipamento'

    expect(page).to have_content 'Não foi possível cadastrar equipamento'
  end
end