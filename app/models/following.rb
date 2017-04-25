class Following < ApplicationRecord
  belongs_to :user
  belongs_to :following_question, class_name: "Question"
end
