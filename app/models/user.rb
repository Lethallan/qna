class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions, foreign_key: :user_id
  has_many :answers, foreign_key: :user_id

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
end
