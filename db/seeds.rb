# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
Equipment.destroy_all
Contract.destroy_all

customer = Customer.create(name: 'Rodrigo',
                         legal_name: 'Clockwork',
                         customer_type: '0',
                         document: '777777777-99',
                         fiscal_number: '5688275429',
                         contact_name: 'Paula',
                         phone_number: '1406-1406',
                         email: 'rcecosta@gmail.com',
                         address: 'Explanada dos ministérios, 33')

categoria = Category.create(name: 'Furadeira')

equipment = Equipment.create(category: categoria,
                                serial_number: "AGCBRA001",
                                acquisition_date: "2016-11-17 20:26:23",
                                replacement_value: 100.5,
                                usage_limit: 10,
                                description: "Makita 120v")
Contract.create(customer: customer,
                rental_period: 30,
                delivery_address: "Av. Paulista, n-55, cep 122222",
                contact: "Joao",
                payment_method: "a vista",
                amount: 1000.5,
                discount: 100.0,
                total_amount: 900.5,
                equipment: [equipment])
