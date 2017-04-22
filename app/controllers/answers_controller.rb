class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    q = Question.find(params[:question_id])
    answer = q.answers.create(answer_params)
    respond_with q, answer
  end

  def show
     q = Question.find(params[:question_id])
     answer = q.answers.find(params[:answer_id])
     respond_with q, answer
  end

  private

     # ALLOW CONTROLLERS TO USE  PARAMS TO MASS ASSIGN A RESOURCE
     # RETURNS ATTRIBUTES OF AN OBJECT PARAMS
       def answer_params

         # WHAT DOES PARAMS.REQUIRE DO?
         params.require(:answer).permit(:content)
       end

           def authorize_user
             q = Question.find(params[:question_id])
             answer = q.answers.find(params[:answer_id])            # #11
                unless current_user == answer.user || current_user.admin?
                  flash[:alert] = "You must be an admin to do that."
                  redirect_to [answer.question, answer]
                end
           end

end
 # require sign in to CRU answers excapt for show
# before_action :require_sign_in, except: :show
#
# before_action :authorize_user, except: [:show, :new, :create]
#

# # DISPLAYS VIEW FOR answer AND TAKES IN answer DATA USING FORM_FOR, PASSING DATA TO CREATE
#   def new
#     @question = Question.find(params[:question_id])
#     @answer = Answer.new
#   end
#
# # CREATES AND SAVES NEW POST TO DB, REDIRECTING TO NEWLY CREATED POST AFTER
# # TAKES IN: create new post
#
# # PARAMS IS TAKING IN THE ID OF question, FROM THE FORM_FOR? OR THE URL?
#   def create
#     @question = Question.find(params[:question_id])
#
#     # creates(BUILDS) post in a question with the ALLOWED attributes and associated user
#
#     # wiat I thought this should already save, hmmm......shouldn't this error out?
#     @answer = @question.answers.build(answer_params)
#     # @answer = @question.answers.new(answer_params)
#     @answer.user = current_user
#
#     puts @question.tags
#     puts @answer.tags
#
# #update data, handle errors
#     if @answer.save
#       # save a notice for DISPLAYING IN APPLCAITON LAYOUT.
#       flash[:notice] = "Answer was created."
#
#       # THIS JUST CALLS THE GET REQUEST PASSING IN THE ID OF THE asnwer BY DEFAIULT IRHGT?
#       redirect_to @question # HERE PARAMS IS STORING answer DATA
#     else
#       flash.now[:alert] = "There was an error saving the answer. Please try again."
#       render :new
#     end
#   end
#
#   def edit
#     @answer = Answer.find(params[:id])
#   end
#
#   def show
#     @answer = Answer.find(params[:id])
#   end
#
#
#    def destroy
#      @answer = Answer.find(params[:id])
#
#  # #8
#      if @answer.destroy
#        flash[:notice] = "\"#{@answer.content}\" was deleted successfully."
#        redirect_to @answer.question
#      else
#        flash.now[:alert] = "There was an error deleting the answer."
#        render :show
#      end
#    end
#
#  # WOULD  IT BE FINE IF UPDATE DIDN'T USE PARENT question INFORMATION? in it's route? shallow?
#    def update
#       @answer = Answer.find(params[:id]) #is thsi query url paramertes from edit?
# # UPDATE ATTRIBUTES
#       @answer.assign_attributes(answer_params)
#
#       if @answer.save
#         flash[:notice] = "answer updated."
#         redirect_to [@answer.question, @answer]
#       else
#         flash.now[:alert] = "Error updating. Try again."
#         render :edit
#       end
#    end




# # ActiveRecord CALLBACKS CAN TAKE IN PARAMS TOO!!!
#     def authorize_user
#          answer = Answer.find(params[:id])
#      # #11
#          unless current_user == answer.user || current_user.admin?
#            flash[:alert] = "You must be an admin to do that."
#            redirect_to [answer.question, answer]
#          end
#     end
#
