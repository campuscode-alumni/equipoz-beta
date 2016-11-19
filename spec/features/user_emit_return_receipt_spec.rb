require 'rails_helper'

feature 'User emit return receipt' do
    scenario 'successfully'do
      return_receipt = ReturnReceipt.new(employee: 'João',
                                         document: '123')

     customer = Customer.new(name: 'Gafisa',
                              legal_name: 'Clockwork',
                              customer_type: '0',
                              document: '777777777-99',
                              fiscal_number: '5688275429',
                              contact_name: 'Paula',
                              phone_number: '1406-1406',
                              email: 'rcecosta@gmail.com',
                              address: 'Explanada dos ministérios, 33')
      customer.save

      contract = Contract.create(customer: customer,
                              equipment: 'Betoneira',
                              rental_period: 3.days,
                              delivery_address: 'Av. Paulista',
                              contact: 'Alan',
                              payment_method: 'Propina',
                              amount: 3330.0,
                              discount: 1000.0,
                              total_amount: 2330.0)


      visit contracts_path

      click_on 'Emitir Devolução'

      fill_in 'Funcionario', with: return_receipt.employee
      fill_in 'Documento', with: return_receipt.document

      click_on 'Emitir Recibo de Entrega'

      expect(page).to have_content return_receipt.employee
      expect(page).to have_content return_receipt.document
  end
end
