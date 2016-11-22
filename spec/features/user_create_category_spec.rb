require 'rails_helper'

feature 'User create category' do
  scenario 'successfully' do

    category = build(:category)

    visit new_category_path

    fill_in 'Nome', with: category.name
    click_on 'criar categoria'

    expect(page).to have_content(category.name)
  end

  scenario 'And empty name' do
    visit new_category_path

    click_on 'criar categoria'

    expect(page).to have_content "can't be blank"
  end

  scenario 'Category must be unique' do

    category = create(:category, name: 'Furadeira')

    visit new_category_path

    fill_in 'Nome', with: 'Furadeira'
    click_on 'criar categoria'

    expect(page).to have_content 'has already been taken'

  end

end
