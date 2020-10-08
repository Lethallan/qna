class Question < ApplicationRecord
  has_many :answers
  belongs_to :user, foreign_key: :user_id

  validates :title, :body, presence: true
end
