class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  # OVERRIDE
  # TO INCLUDE question and answer's USER for each JSON REQUEST
   def as_json(options = {})
     super(options.merge(include: [:user, answers: {include: :user}] ))
   end
end
