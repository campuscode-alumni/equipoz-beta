require 'rails_helper'

feature 'user create delivery receipt' do
  scenario 'User visit contract page to create delivery receipt' do
    contract = create(:contract)

    visit contract_path(contract)

    expect(page).to have_content 'Emitir Recibo de Entrega'
  end

end