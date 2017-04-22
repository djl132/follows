class Answer < ApplicationRecord

  # CREATE VIRTUAL ATTRIBUTES TO ASSIGN REFERENCED COLUMNS IN THE TABLE
  belongs_to :user
  belongs_to :question
end
