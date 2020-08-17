require 'rails_helper'
require 'support/integration_test_helpers'
RSpec.describe 'users_controller', type: :system do
  include IntegrationTestHelpers
  before :each do
    User.create(fullname: 'user', username: 'user')
  end
  describe 'signup/in user' do
    it 'sign up' do
      visit new_user_path
      fill_in('user_username', with: 'user1')
      fill_in('user_fullname', with: 'user1')
      attach_file('user[photo]', Rails.root + 'app/assets/images/avatar-test.svg')
      attach_file('user[cover_image]', Rails.root + 'app/assets/images/background-test.svg')
      click_button('Sign up')
      expect(page).to have_content 'user has been successfully created'
    end
    it 'sign in' do
      do_login('user')
      expect(page).to have_content 'user successfully Loged in'
    end
    it 'sign out' do
      do_login('user')
      click_link('signout')
      expect(page).to have_content 'user signout successfully'
    end
  end

  describe 'searching' do
    it 'search for users' do
      do_login('user')
      visit users_path
      fill_in('term', with: 'user')
      click_button('search')
      expect(page).to have_content 'user'
    end
  end
end
