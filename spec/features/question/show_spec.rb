require 'rails_helper'

feature 'Any user can see a question and its answers', %q{
  In order to get information
  As a user
  I'd like to see any question and its answers
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:answers) { create_list(:answer, 3, question: question, user: user) }

  scenario 'Authenticated user sees a question with list of all answers' do
    sign_in(user)
    visit questions_path
    click_on question.body

    expect(page).to have_content question.title
    expect(page).to have_content question.body
    answers.each { |answer| expect(page).to have_content answer.body }
  end

  scenario 'Unauthenticated user sees a question with list of all answers' do
    visit questions_path
    click_on question.body

    expect(page).to have_content question.title
    expect(page).to have_content question.body
    answers.each { |answer| expect(page).to have_content answer.body }
  end
end
