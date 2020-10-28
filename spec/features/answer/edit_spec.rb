require 'rails_helper'

feature 'User can edit answers', %q{
  In order to remove unneeded information
  As an authenticated user and answers's author
  I'd like to be able to delete my own answers
} do

  given(:users) { create_list(:user, 2) }
  given!(:question) { create(:question, user_id: users.first.id) }
  given!(:answer) { create(:answer, question: question, user_id: users.first.id) }

  describe 'Authenticated user' do
    scenario 'tries to edit theit own answer' do
      sign_in(users.first)
      visit questions_path
      click_on question.body

      expect(page).to have_selector '.editAnswer'
    end

    scenario "tries to delete other user's answer" do
      sign_in(users.last)
      visit questions_path
      click_on question.body

      expect(page).to_not have_selector '.editAnswer'
    end
  end

  scenario 'Unauthenticated user tries to edit any answer' do
    visit questions_path
    click_on question.body

    expect(page).to_not have_selector '.editAnswer'
  end
end