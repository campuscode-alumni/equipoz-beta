require 'rails_helper'

feature 'Visitors view category' do
  scenario 'on home#index' do
    category = create(:category)
    visit root_path
    within('.container') do
      expect(page).to have_content category.name
    end
  end
end
