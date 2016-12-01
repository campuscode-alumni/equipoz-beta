require 'rails_helper'

feature 'user access admin panel' do
	scenario 'user access admin panel with success' do
		user = create(:user)

		visit root_path

		click_on 'Logar'

		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password

		click_on 'Log in'

		expect(page).to have_content('Sair')
		expect(page).to have_content('Painel administrativo')
	end

	scenario 'User cant access admin panel' do
		visit root_path

		click_on contracts_path

		expect(page).to not have_content('Painel Administrativo')
		expect(page).to have_content('Logar')
	end


end
