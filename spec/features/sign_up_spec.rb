require 'rails_helper'

# feature 'User can sign up', %q{
#   In order to ask questions
#   As an unauthenticated user
#   I'd like to be able to create an account
# } do

#   scenario 'Unregistered user tries to sign up' do
#     visit root_path
#     click_on 'Sign in'
#     click_on 'Create an account'

#     fill_in 'Email', with: 'user@test.com'
#     fill_in 'Password', with: '12345678'
#     fill_in 'Password confirmation', with: '12345678'
#     click_on 'Sign up'

#     expect(page).to have_content 'Welcome! You have signed up successfully.'
#   end
# end