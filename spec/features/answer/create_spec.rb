require 'rails_helper'

feature 'User can create answers', %q{
  In order to give an answer
  As an authenticated user
  I'd like to be able to answer the questions
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }

  describe 'Authenticated user' do
    background do
      sign_in(user)

      visit questions_path
      click_on question.body
      expect(page).to have_content 'Your answer'
    end

    scenario 'answers a question' do
      fill_in 'answer_body', with: 'Hey there!'
      click_on 'Submit'

      expect(page).to have_content 'Hey there!'
    end

    scenario 'answers a question with errors' do
      click_on 'Submit'

      expect(page).to have_content "Body can't be blank"
    end

    scenario 'answers with files' do
      fill_in 'answer_body', with: 'Bla bla bla'

      attach_file 'File', ["#{Rails.root}/spec/controllers/questions_controller_spec.rb", "#{Rails.root}/spec/controllers/answers_controller_spec.rb"]
      click_on 'Submit'

      expect(page).to have_link 'questions_controller_spec.rb'
      expect(page).to have_link 'answers_controller_spec.rb'
    end
  end

  scenario 'Unauthenticated user tries to answer a question' do
    visit questions_path
    click_on question.body

    expect(page).to_not have_content 'Your answer'
  end
end
