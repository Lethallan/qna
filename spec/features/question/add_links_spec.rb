require 'rails_helper'

feature 'User can add links to question', %q{
  In order to provide additional info to my question
  As an question's author
  I'd like to be able to add links
} do

  given(:user) { create(:user) }
  given(:gist_url) { 'https://gist.github.com/Lethallan/41573fc9f1b6f730e22a598e36b6975e' }

  scenario 'User adds a link when asks question' do
    sign_in(user)
    visit new_question_path

    fill_in 'Title', with: 'Question title'
    fill_in 'Text', with: 'blablabla'

    fill_in 'Link name', with: 'Gist'
    fill_in 'Url', with: gist_url

    click_on 'Submit'

    expect(page).to have_link 'Gist', href: gist_url
  end
end