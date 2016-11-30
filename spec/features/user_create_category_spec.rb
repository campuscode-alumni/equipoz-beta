require 'rails_helper'

feature 'User create category' do
  scenario 'visiting #new' do
    visit root_path
    click_on 'Painel Administrativo'
    click_on 'Nova Categoria'
    expect(new_category_path)
  end

  scenario 'successfully' do
    category = build(:category)

    visit new_category_path

    fill_in 'Nome', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_content(category.name)
  end

  scenario 'And empty name' do
    visit new_category_path

    click_on 'Criar Categoria'

    expect(page).to have_content 'não pode ficar em branco'
  end

  scenario 'Category must be unique' do
    create(:category, name: 'Furadeira')

    visit new_category_path

    fill_in 'Nome', with: 'Furadeira'
    click_on 'Criar Categoria'

    expect(page).to have_content 'já está em uso'
  end

  scenario 'and can go back to contract#index' do
    visit new_category_path
    click_on 'Voltar'
    expect(contracts_path)
  end
end
