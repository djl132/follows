class Api::V1::CommentsController < ApiController
# must be signed in to create comment
# before_action :require_sign_in
#
# # if want to destory, must be authorized
before_action :authenticate_user!, only: [:create]
before_action :authorize_user, only: [:destroy]

def index
  answer = Answer.find(params[:answer_id])
  respond_with :api, :v1, answer.comments
end

def create
   answer = Answer.find(params[:answer_id])
   comment = answer.comments.create(comment_params.merge(user_id: current_user.id))
   respond_with :api, :v1, answer, comment
end

 # def upvote
 #   answer = Answer.find(params[:post_id])
 #   comment = answer.comments.find(params[:id])
 #   comment.increment!(:upvotes)
 #
 #   respond_with :api, :v1, answer, comment
 # end
 #
 # def downvote
 #   answer = Answer.find(params[:post_id])
 #   comment = answer.comments.find(params[:id])
 #   comment.increment!(:downvotes)
 #
 #   respond_with :api, :v1, answer, comment
 # end

 private
   def comment_params
     params.require(:comment).permit(:body)
   end

   def authorize_user
     answer = Answer.find(params[:answer_id])
     comment = answer.comments.find(params[:id])
     unless current_user == comment.user || current_user.admin?
       flash[:alert] = "You do not have permission to delete the comment."
       redirect_to [comment.answer.question, comment.answer]
     end
   end

 end



# def create
#   @answer = Answer.find(params[:answer_id])
#   # look over mass assignment
#   comment = @answer.comments.new(comment_params)
#   comment.user = current_user
#
#     if comment.save
#       flash[:notice] = "Comment saved successfully."
#       redirect_to [@answer.question, @answer] # re render answer page
#     else
#       flash[:alert] = "Comment failed to save."
#       redirect_to [@answer.question, @answer] # re render answer page
#     end
# end
#
# def destroy
#
#   # why not juse use the COMMENT id??????
#   @answer = Answer.find(params[:answer_id])
#   comment = @answer.comments.find(params[:id])
#
#   if comment.destroy
#     flash[:notice] = "Comment was deleted."
#     redirect_to [@answer.question , @answer]
#   else
#     flash[:alert] = "Comment couldn't be deleted. Try again."
#     redirect_to [@answer.question, @answer]
#   end
# end
#
#
# private
#     def comment_params
#       params.require(:comment).permit(:content, :image, :file)
#     end
#
# authoize Destroy comment

#
# end
