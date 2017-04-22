class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :answer


  # OVERRIDE
  # TO INCLUDE USER ASSOCATION OBJECT ALSO
   def as_json(options = {})
     super(options.merge(include: :user))
   end
end
