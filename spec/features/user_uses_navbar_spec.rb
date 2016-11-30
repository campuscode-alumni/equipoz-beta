require 'rails_helper'

feature 'user uses navbar' do
  scenario 'User clicks on Equipamento' do
    visit root_path

    click_on 'Equipamento'

    expect(current_path).to eq new_equipment_path
  end
  
  scenario 'User clicks on Logar' do
    visit root_path

    click_on 'Logar'

    expect(current_path).to eq new_user_session_path
  end

  scenario 'User clicks on Contratos and Novo' do
    visit root_path

    click_on 'Contratos'

    click_on 'Novo'

    expect(current_path).to eq new_contract_path
  end

  scenario 'User clicks on Contratos and Ver todos' do
    visit root_path

    click_on 'Contratos'

    click_on 'Ver todos'

    expect(current_path).to eq contracts_path
  end

  scenario 'User clicks on Categorias' do
    user = create(:user)
    login_as(user)
    visit root_path

    click_on 'Categoria'

    expect(current_path).to eq new_category_path
  end

  scenario 'User clicks on Cliente' do
    visit root_path

    click_on 'Cliente'

    expect(current_path).to eq new_customer_path
  end
end
