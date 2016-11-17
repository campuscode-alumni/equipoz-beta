require 'rails_helper'

feature 'User register tools' do 
	scenario 'successfully access the register page' do

		visit new_tool_path

		expect(page).to have_css('h1', text:'Cadastro de Equipamentos')
		expect(page).to have_content 'Cadastrar Equipamento'
	end
end