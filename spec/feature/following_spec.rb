require 'rails_helper'
require 'support/integration_test_helpers'
RSpec.describe 'followings_controller', type: :system do
  include IntegrationTestHelpers
  before :each do
    User.create(fullname: 'user1', username: 'user1')
    User.create(fullname: 'user2', username: 'user2')
  end
describe "follow user" do
    it 'follow user in the home page' do
        do_login('user1')
        click_link('follow')
        expect(page).to have_content 'you followed user2'
    end
    it 'follow user in the user page' do
        do_login('user1')
        click_link('user2')
        click_link('follow_id')
        expect(page).to have_content 'you followed user2'
    end
end

 
end
