class VotesController < ApplicationController



  def up_vote
    @answer = Answer.find(params[:answer_id])
    @vote = @answer.votes.where(user_id: current_user.id).first
puts @vote.inspect
    if !@vote
      @vote = current_user.votes.create(value: 1, answer: @answer)
    elsif @vote.value == 1
      @vote.destroy
    else
      @vote.update_attribute(:value, 1)
    end

# send to page taht triggered the action
    respond_with @answer.question, @answer
  end

  def down_vote
     @answer = Answer.find(params[:answer_id])
     @vote = @answer.votes.where(user_id: current_user.id).first

     if !@vote
       @vote = current_user.votes.create(value: -1, answer: @answer)
     elsif @vote.value == -1
       @vote.destroy
     else
       @vote.update_attribute(:value, -1)
     end

     respond_with @answer.question, @answer
   end



   private
  #  def update_vote(new_value)
  #    @post = Post.find(params[:post_id])
  #    @vote = @post.votes.where(user_id: current_user.id).first
   #
  #    if @vote
  #      @vote.update_attribute(:value, new_value)
  #    else
  #      @vote = current_user.votes.create(value: new_value, post: @post)
  #    end
  #  end
end
