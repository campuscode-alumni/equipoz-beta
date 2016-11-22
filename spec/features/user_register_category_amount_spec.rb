require 'rails_helper'

feature 'User can register an amount by category' do

  scenario 'successfully' do

    category_amount = build(:category_amount)

    visit new_category_amount_path

    select category_amount.category.name, from: 'Categoria'
    select category_amount.rental_period, from: 'Prazo de Locação'
    fill_in 'Valor', with: category_amount.amount

    click_on 'Registrar Valor'

    expect(page).to have_css('h1', text: category_amount.category.name)
    expect(page).to have_css('strong', text: 'Prazo de Locação')
    expect(page).to have_content(category_amount.rental_period)
    expect(page).to have_css('strong', text: 'Valor')
    expect(page).to have_content(category_amount.amount)
  end
end
