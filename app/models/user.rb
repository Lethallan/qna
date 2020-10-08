class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authored_questions, class_name: 'Question', foreign_key: :user_id
  has_many :authored_answers, class_name: 'Answer', foreign_key: :user_id
end
