class Answer < ApplicationRecord

  # CREATE VIRTUAL ATTRIBUTES TO ASSIGN REFERENCED COLUMNS IN THE TABLE
  belongs_to :user
  belongs_to :question
  has_many :comments


  def as_json(options = {})
    super(options.merge(include: [:user, comments: {include: :user}] ))
  end
end
