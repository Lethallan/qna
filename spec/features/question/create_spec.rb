require 'rails_helper'

feature 'User can create question', %q{
  In order to get answer from a community
  As an authenticated user
  I'd like to be able to ask the question
} do

  given(:user) {create(:user)}

  describe 'Authenticated user' do
    background do
      sign_in(user)

      visit questions_path
      click_on 'Ask a question'
    end

    scenario 'asks a question' do
      fill_in 'Title', with: 'Question title'
      fill_in 'Body', with: 'Bla bla bla'
      click_on 'Submit'

      expect(page).to have_content 'Question title'
      expect(page).to have_content 'Bla bla bla'
    end

    scenario 'asks a question with errors' do
      click_on 'Submit'

      expect(page).to have_content "Title can't be blank"
    end
  end
end
