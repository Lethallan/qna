require 'rails_helper'

feature 'User can create questions', %q{
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

    scenario 'asks a question with files' do
      fill_in 'Title', with: 'Question title'
      fill_in 'Body', with: 'Bla bla bla'

      attach_file 'File', ["#{Rails.root}/spec/rails_helper.rb", "#{Rails.root}/spec/spec_helper.rb"]
      click_on 'Submit'

      expect(page).to have_link 'rails_helper.rb'
      expect(page).to have_link 'spec_helper.rb'
    end
  end

  scenario 'Unauthenticated user tries to ask a question' do
    visit questions_path

    expect(page).to_not have_content 'Ask a question'
  end
end
