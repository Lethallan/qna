require 'rails_helper'

feature 'User can delete questions', %q{
  In order to remove unneeded information
  As an authenticated user and questions's author
  I'd like to be able to delete my own questions
} do

  given(:users) { create_list(:user, 2) }
  given!(:question) { create(:question, user_id: users.first.id) }

  describe 'Authenticated user' do
    scenario 'tries to delete their own question' do
      sign_in(users.first)
      visit questions_path
      click_on question.body

      within '.deleteQuestion' do
        click_on 'Delete this question'
      end

      expect(page).to_not have_content question.body
    end

    scenario "tries to delete other user's question" do
      sign_in(users.last)
      visit questions_path
      click_on question.body

      expect(page).to_not have_selector '.deleteQuestion'
    end
  end

  scenario 'Unauthenticated user tries to delete any question' do
    visit questions_path
    click_on question.body

    expect(page).to_not have_selector '.deleteQuestion'
  end
end
