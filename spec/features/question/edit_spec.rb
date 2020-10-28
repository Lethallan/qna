require 'rails_helper'

feature 'User can edit questions', %q{
  In order to correct possible mistakes
  As an authenticated user and question's author
  I'd like to be able to edit my own questions
} do

  given(:users) { create_list(:user, 2) }
  given!(:question) { create(:question, user_id: users.first.id) }

  describe 'Authenticated user' do
    scenario 'tries to edit theit own question' do
      sign_in(users.first)
      visit questions_path
      click_on question.body

      expect(page).to have_selector '.editQuestion'
    end

    scenario "tries to edit other user's answer" do
      sign_in(users.last)
      visit questions_path
      click_on question.body

      expect(page).to_not have_selector '.editQuestion'
    end
  end

  scenario 'Unauthenticated user tries to edit any question' do
    visit questions_path
    click_on question.body

    expect(page).to_not have_selector '.editQuestion'
  end
end