class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  has_many :followings
  has_many :following_questions, class_name: "Question", foreign_key: "user_id", through: :followings
  # belongs_to :group


  has_many :followings
has_many :following_questions, class_name: "Question", foreign_key: "user_id", through: :followings





end
