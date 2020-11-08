require 'rails_helper'

feature 'Only author can delete files from question', %q{
  In order delete unneeded files
  As an authenticated user and author of question
  I'd like to be able delete files
} do

  given(:users) { create_list(:user, 2) }
  given!(:question) { create(:question, user: users.first) }

  background do
    question.files.attach(io: File.open("#{Rails.root}/spec/rails_helper.rb"), filename: 'rails_helper.rb')
  end

  scenario 'Not authenticated user tried delete file' do
    visit question_path(question)

    expect(page).to_not have_link 'Edit'
  end

  scenario 'Author delete file' do
    sign_in(users.first)
    visit question_path(question)
    click_on 'Edit'
    click_on 'Delete file'

    expect(page).to_not have_content 'rails_helper.rb'
  end

  scenario 'Not author tried delete file' do
    sign_in(users.last)
    visit question_path(question)

    expect(page).to_not have_link 'Edit'
  end
end