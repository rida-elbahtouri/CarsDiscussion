module IntegrationTestHelpers
    def do_login(username)
      visit new_session_path
      fill_in('username', with: username)
      click_button('commit')
    end
  
  
    def create_thought(text)
      fill_in('thought_text', with: text)
      click_button('commit')
    end

  end
  