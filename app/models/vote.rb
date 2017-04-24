class Vote < ApplicationRecord

  after_save :update_answer_of_vote

  # after_save :update_user
  belongs_to :user
  belongs_to :answer

  validates :value, inclusion: {in: [1,-1], message: "%{value} is not valid vote."}, presence: true


  private

  def update_answer_of_vote
    # answer.update_rank
    answer.update_votes
    # puts "Answer has this many points: #{{answer.upvotes - answer.downvotes}}"
  end



  # def update_user
  #   answer.user..upvote
  # end


end
