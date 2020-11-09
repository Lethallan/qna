# require 'rails_helper'

# RSpec.describe FilesController, type: :controller do
#   describe 'DELETE #destroy' do
#     let!(:user) { create(:user) }
#     let!(:file) { fixture_file_upload("#{Rails.root}/spec/rails_helper.rb") }
#     let!(:question) { create(:question, user: user, files: file) }

#     before { sign_in(user) }

#     it 'deletes file' do
#       expect { delete :destroy, params: { id: question.files.first, question_id: question } }.to change(question.files, :count).by(-1)
#     end

#     it 'redirects to question' do
#       delete :destroy, params: { id: question.files.first }
#       expect(response).to redirect_to question
#     end
#   end
# end