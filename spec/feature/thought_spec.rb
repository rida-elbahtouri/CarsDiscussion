require 'rails_helper'
require 'support/integration_test_helpers'
RSpec.describe 'thoughts_controller', type: :system do
  include IntegrationTestHelpers
  before :each do
    User.create(fullname: 'user1', username: 'user1')
  end

  it 'create thoughts' do
    do_login('user1')
    create_thought('hello it is a testing post')
    expect(page).to have_content 'your news has been published'
  end
end
