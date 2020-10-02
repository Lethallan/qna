require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create(:question) }
  let(:answer) { create(:answer, question: question) }

  describe 'GET #show' do
    before { get :show, params: { id: answer } }

    it 'assigns the requested answer to @answer' do
      expect(assigns(:answer)).to eq answer
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new, params: { question_id: question } }

    it 'assigns a new answer to @answer' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: answer, question_id: question } }

    it 'assigns the requested answer to @answer' do
      expect(assigns(:answer)).to eq answer
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a new answer in the database' do
        expect { post :create, params: { question_id: question, answer: attributes_for(:answer) } }.to change(question.answers, :count).by(1)
      end

      it 'redirects to show' do
        post :create, params: { question_id: question, answer: attributes_for(:answer) }
        expect(response).to redirect_to assigns(:answer)
      end
    end

    context 'with wrong attributes' do
      it 'does not save the question' do
        expect { post :create, params: { answer: attributes_for(:answer, :wrong), question_id: question } }.to_not change(Answer, :count)
      end

      it 'renders new view again' do
        post :create, params: { answer: attributes_for(:answer, :wrong), question_id: question }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'assigns the requested answer to @answer' do
        patch :update, params: { id: answer, answer: attributes_for(:answer) }
        expect(assigns(:answer)).to eq answer
      end

      it 'changes answer attributes' do
        patch :update, params: { id: answer, answer: { body: 'even greater answer' } }
        answer.reload

        expect(answer.body).to eq 'even greater answer'
      end

      it 'redirects to updated answer' do
        patch :update, params: { id: answer, answer: attributes_for(:answer) }
        expect(response).to redirect_to answer
      end
    end

    context 'with wrong attributes' do
      before { patch :update, params: { id: answer, answer: attributes_for(:answer, :wrong) } }

      it 'does not change the question' do
        answer.reload

        expect(answer.body).to eq 'The best answer ever'
      end

      it 'renders edit view again' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:answer) { create(:answer, question: question) }

    it 'deletes the answer' do
      expect { delete :destroy, params: { question_id: question, id: answer } }.to change(question.answers, :count).by(-1)
    end

    it 'redirects to question' do
      delete :destroy, params: { question_id: question, id: answer }
      expect(response).to redirect_to question
    end
  end
end