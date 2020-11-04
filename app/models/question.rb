class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user, foreign_key: :user_id

  has_one_attached :file

  validates :title, :body, presence: true
end
