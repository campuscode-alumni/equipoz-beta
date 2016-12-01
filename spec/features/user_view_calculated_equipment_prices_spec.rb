require 'rails_helper'

feature 'user view total amount of contract' do
  scenario 'user visit contract prices' do
    category = create(:category)
    category_amount = create(:category_amount, category: category)
    equipment = create(:equipment, category: category)
    contract = create(
      :contract,
      equipment: [equipment],
      rental_period: category_amount.rental_period
    )

    visit prices_contract_path(contract.id)

    expect(page).to have_content equipment.full_name
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.rental_period
  end

  scenario 'user provide discount value' do
    category = create(:category)
    category_amount = create(:category_amount, category: category)
    equipment = create(:equipment, category: category)
    contract = create(
      :contract,
      equipment: [equipment],
      rental_period: category_amount.rental_period
    )

    visit prices_contract_path(contract.id)

    fill_in 'Desconto', with: contract.discount

    click_on 'Registrar Desconto'

    expect(page).to have_content(contract.amount)
    expect(page).to have_content(contract.discount)
    expect(page).to have_content(contract.total_amount)
  end
end
