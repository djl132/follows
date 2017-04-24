class Answer < ApplicationRecord

  # CREATE VIRTUAL ATTRIBUTES TO ASSIGN REFERENCED COLUMNS IN THE TABLE
  belongs_to :user
  belongs_to :question
  has_many :comments
  has_many :votes


  def as_json(options = {})
    super(options.merge(include: [:user, comments: {include: :user}] ))
  end


    def up_votes
      votes.where(value: 1).count
    end

    def down_votes
      votes.where(value: -1).count
    end

    def update_votes
      update_attribute(:upvotes, up_votes)
      puts up_votes
      update_attribute(:downvotes, down_votes)
      puts down_votes

    end

    def points
      # INNER  JOIN???
      votes.sum(:value)
    end


# # update rank every time a vote is created
#     def update_rank
#         age_in_days = (created_at - Time.new(1970,1,1))/1.day.seconds
#         new_rank = points + age_in_days
#         update_attribute(:rank, new_rank)
#     end

end
