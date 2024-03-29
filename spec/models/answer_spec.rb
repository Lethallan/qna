require 'rails_helper'

RSpec.describe Answer, type: :model do
  context 'associations' do
    it { should belong_to :question }
    it { should have_many(:links).dependent(:destroy) }
    it { should belong_to :user}
  end

  context 'validations' do
    it { should validate_presence_of :body }
  end

  context 'files' do
    it 'have many attached files' do
      expect(Question.new.files).to be_an_instance_of(ActiveStorage::Attached::Many)
    end
  end

  context 'nested attributes' do
    it { should accept_nested_attributes_for :links }
  end
end
