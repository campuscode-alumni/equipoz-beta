require 'rails_helper'

feature 'User visit admin page' do
  scenario 'successfully' do
    visit root_path

    click_on 'Painel Administrativo'

    within('nav') do
      expect(page).to have_xpath(".//a[@href = '#{new_contract_path}']")
      expect(page).to have_xpath(".//a[@href = '#{new_customer_path}']")
      expect(page).to have_xpath(".//a[@href = '#{new_equipment_path}']")
    end
  end
end
