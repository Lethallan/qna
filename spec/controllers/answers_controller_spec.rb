require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:user) { create(:user) }
  let(:question) { create(:question) }

  before { login(user) }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'assigns a parent question to the answer' do
        expect { post :create, params: { answer: attributes_for(:answer), question_id: question } }.to change(question.answers, :count).by(1)
      end

      it 'saves a new answer in the database' do
        expect { post :create, params: { question_id: question, answer: attributes_for(:answer) } }.to change(question.answers, :count).by(1)
      end

      it "redirects to this answer's question's show view" do
        post :create, params: { answer: attributes_for(:answer), question_id: question }
        expect(response).to redirect_to question_path(question)
      end

      it 'assigns an author to the answer' do
        expect { post :create, params: { answer: attributes_for(:answer), question_id: question } }.to change(user.answers, :count).by(1)
      end
    end

    context 'with wrong attributes' do
      it 'does not save the answer' do
        expect { post :create, params: { answer: attributes_for(:answer, :wrong), question_id: question } }.to_not change(Answer, :count)
      end
    end
  end

  # describe 'PATCH #update' do
  #   let!(:users) { create_list(:user, 2) }
  #   let!(:answer) { create(:answer, question_id: question, user_id: user) }

  #   before { log_in(users.first) }

  #   context 'with valid attributes' do
  #     it 'assigns the requested answer to @answer' do
  #       patch :update, params: { id: answer, answer: attributes_for(:answer) }
  #       expect(assigns(:answer)).to eq answer
  #     end

  #     it 'changes answer attributes' do
  #       patch :update, params: { id: answer, answer: { body: 'even greater answer' } }
  #       answer.reload

  #       expect(answer.body).to eq 'even greater answer'
  #     end

  #     it "redirects to this answer's question's show view" do
  #       post :create, params: { answer: attributes_for(:answer), question_id: question }
  #       expect(response).to redirect_to question_path(question)
  #     end
  #   end

  #   context 'with wrong attributes' do
  #     before { patch :update, params: { id: answer, answer: attributes_for(:answer, :wrong) } }

  #     it 'does not change the answer' do
  #       answer.reload

  #       expect(answer.body).to eq 'The best answer ever'
  #     end

  #     it 'renders edit view again' do
  #       expect(response).to render_template :edit
  #     end
  #   end
  # end

  describe 'DELETE #destroy' do
    let!(:users) { create_list(:user, 2) }
    let!(:answer) { create(:answer, question: question, user_id: users.first.id ) }

    context 'user is author' do
      before { sign_in(users.first) }

      it 'deletes the answer' do
        expect { delete :destroy, params: { id: answer, question_id: question } }.to change(Answer, :count).by(-1)
      end

      it 'redirects to question' do
        delete :destroy, params: { id: answer, question_id: question }
        expect(response).to redirect_to question_path(question)
      end
    end

    context 'user is not an author' do
      before { sign_in(users.last) }

      it 'does not delete an answer' do
        expect { delete :destroy, params: { id: answer, question_id: question } }.to_not change(Answer, :count)
      end
    end
  end
end