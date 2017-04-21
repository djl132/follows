class ReviewsController < ApplicationController

# must be signed in to create comment
before_action :require_sign_in

# if want to destory, must be authorized
before_action :authorize_user, only: [:destroy]

def create
  # look over mass assignment
  review = Review.new(review_params)
  review.reviewed = User.find(params[:user_id])
  review.reviewer = current_user

    if review.save
      flash[:notice] = "Review submitted successfully."
      redirect_to review.reviewed # re render user page
    else
      flash[:alert] = "Review failed to save."
      redirect_to  review.reviewed # re render user page
    end
end

def destroy

  # why not juse use the COMMENT id??????
  review = Review.find(params[:id])

  if review.destroy
    flash[:notice] = "Review was deleted."
    redirect_to review.reviewed
  else
    flash[:alert] = "Review couldn't be deleted. Try again."
    redirect_to review.reviewed
  end
end


private
    def review_params
      params.require(:review).permit(:content, :friendliness, :accuracy, :clarity)
    end

# authoize Destroy comment
    def authorize_user
      review = Review.find(params[:id])
      unless current_user == review.reviewer || current_user.admin?
        flash[:alert] = "You do not have permission to delete the review."
        redirect_to review.reviewed
      end
    end


end
