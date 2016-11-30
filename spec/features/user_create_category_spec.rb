require 'rails_helper'

feature 'User create category' do
  scenario 'visiting #new' do
    user = create(:user) 

    visit root_path

    click_on 'Painel Administrativo'
    click_on 'Nova Categoria'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log in' 

    expect(new_category_path)
  end

  scenario 'successfully' do
    category = build(:category)
    user = create(:user) 

    login_as(user)

    visit new_category_path
    
    fill_in 'Nome', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_content(category.name)
  end

  scenario 'And empty name' do
    user = create(:user) 

    login_as(user)

    visit new_category_path

    fill_in 'Nome', with: ''
    click_on 'Criar Categoria'

    expect(page).to have_content 'não pode ficar em branco'
  end

  scenario 'Category must be unique' do
    create(:category, name: 'Furadeira')
    user = create(:user) 

    login_as(user)

    visit new_category_path

    fill_in 'Nome', with: 'Furadeira'
    click_on 'Criar Categoria'

    expect(page).to have_content 'já está em uso'
  end

  scenario 'and can go back to contract#index' do
    user = create(:user) 

    login_as(user)

    visit new_category_path
    click_on 'Voltar'
    expect(contracts_path)
  end
end
