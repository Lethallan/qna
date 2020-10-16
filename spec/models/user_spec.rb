require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it {should have_many :questions}
    it {should have_many :answers}
  end

  context 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password}
    it { should validate_presence_of :nickname}
  end
end
