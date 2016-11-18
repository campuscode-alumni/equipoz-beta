require 'rails_helper'

feature 'User create client' do
    scenario 'successfully'do
     customer = Customer.new(name: 'Rodrigo',
                              legal_name: 'Clockwork',
                              customer_type: '0',
                              document: '777777777-99',
                              fiscal_number: '5688275429',
                              contact_name: 'Paula',
                              phone_number: '1406-1406',
                              email: 'rcecosta@gmail.com',
                              address: 'Explanada dos ministérios, 33')

      visit new_customer_path
      fill_in 'Nome', with: customer.name
      fill_in 'Razão Social', with: customer.legal_name
      fill_in 'Tipo de Cliente', with: customer.customer_type
      fill_in 'CPF/CNPJ', with: customer.document
      fill_in 'Inscrição Estadual', with: customer.fiscal_number
      fill_in 'Contato', with: customer.contact_name
      fill_in 'Telefone', with: customer.phone_number
      fill_in 'E-mail', with: customer.email
      fill_in 'Endereço', with: customer.address

      click_on 'Cadastrar Cliente'

      created_customer = Customer.last

      expect(page).to have_current_path(customer_path(created_customer))

      expect(page).to have_css('h1', text: customer.name)
      expect(page).to have_content customer.legal_name
      expect(page).to have_content customer.customer_type
      expect(page).to have_content customer.document
      expect(page).to have_content customer.fiscal_number
      expect(page).to have_content customer.contact_name
      expect(page).to have_content customer.phone_number
      expect(page).to have_content customer.email
      expect(page).to have_content customer.address

    end

    scenario 'unsuccessfully' do

      visit new_customer_path
      click_on 'Cadastrar Cliente'
      #cadastrar sem dados
      expect(page).to have_content 'Não foi possível cadastrar o cliente'
    end
end
