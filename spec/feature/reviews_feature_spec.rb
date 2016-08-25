require 'rails_helper'

feature 'reviewing' do
  before do
    Restaurant.create name: 'KFC'
    User.create(email: "test@test.co.uk", password: "123456")

  end
  scenario 'allows users to leave a review using a form' do

    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'test@test.co.uk'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end
end
