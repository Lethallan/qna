require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'associations' do
    it { should have_many :answers}
    it { should belong_to :user}
  end

  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end
end
