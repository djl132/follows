class Question < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :answers

  # OVERRIDE
  # TO INCLUDE question and answer's USER for each JSON REQUEST
   def as_json(options = {})
     super(options.merge(include: [:group, :user, answers: {include: [:user, :comments]} ] ))
   end
end
