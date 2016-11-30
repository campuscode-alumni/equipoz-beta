require 'rails_helper'

feature 'user access admin panel' do
	scenario 'user access admin panel with success' do
		user = build(:user)

		visit root_path

		click_on 'Logar'

		fill_in 'Usuário', with: user.email
		fill_in 'Senha', with: user.password

		click_on 'Entrar'

		expect(page).to have_content('Sair')
		expect(page).to have_content('Painel administrativo')
	end
end
