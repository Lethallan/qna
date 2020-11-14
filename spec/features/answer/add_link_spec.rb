require 'rails_helper'

feature 'User can add links to answer', %q{
  In order to provide additional info to my answer
  As an answer's author
  I'd like to be able to add links
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question) }
  given(:gist_url) { 'https://gist.github.com/Lethallan/41573fc9f1b6f730e22a598e36b6975e' }

  scenario 'User adds a link when asks answer' do
    sign_in(user)

    visit question_path(question)

    fill_in 'answer_body', with: 'Hey there!'
    click_on 'Submit'

    fill_in 'Link name', with: 'Gist'
    fill_in 'Url', with: gist_url

    click_on 'Submit'

    within '.allAnswers' do
      expect(page).to have_link 'Gist', href: gist_url
    end
  end
end