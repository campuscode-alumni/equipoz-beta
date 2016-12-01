require 'rails_helper'

feature 'User view available equipment' do
  scenario 'successfully' do
    create(:equipment)
    create(:equipment, available: false)

    visit contracts_path
    within('#equipment') do
      click_on 'Ver todos'
    end

    expect(page).to have_css('td', text: 'Disponível')
    expect(page).to have_css('td', text: 'Não Disponível')
  end
end
