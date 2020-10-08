class Question < ApplicationRecord
  has_many :answers
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', optional: true

  validates :title, :body, presence: true
end
