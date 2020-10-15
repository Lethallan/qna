require 'rails_helper'

feature 'Any user can see the list of question', %q{
  In order to get information
  As a user
  I'd like to see the list of all qiestions
} do

  given(:user) { create(:user) }
  given!(:questions) { create_list(:question, 3, user: user) }

  scenario 'Authenticated user sees list of all questions' do
    sign_in(user)
    visit questions_path

    questions.each { |question| expect(page).to have_content question.title }
  end

  scenario 'Unauthenticated user sees list of all questions' do
    visit questions_path

    questions.each { |question| expect(page).to have_content question.title }
  end

end
