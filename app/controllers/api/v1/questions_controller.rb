  class Api::V1::QuestionsController < ApiController

    # MUST be signed in as an admin in order to CREATE, UPDATE, NEW, EDIT
    # before_action :require_sign_in, except: [:index, :show]
    before_action :authenticate_user!, except: [:index, :show]

    def index
      respond_with :api, :v1, Question.all
    end

    def create
        # MERGE INFORMATION INTO PARAMS FOR MASS-ASSIGNMENT
        group = Group.find_by(name: params[:topic])
        question = Question.create(question_params.merge(user_id: current_user.id, group: group))
        # question.group_id = Group.find_by(name: params[:question][:topic]).id
        respond_with :api, :v1, question
    end

     def show
       puts "went through"
       respond_with :api, :v1, Question.find(params[:id])
     end


# creates another hash that is strong PARAMETERIZED, FILTERED for MASS ASSIGNMENT.
     private
     def question_params
        params.require(:question).permit(:title, :body, :topic)
     end



   end


#
#  def index
#    if params[:tag]
#      @questions = Question.tagged_with(params[:tag]).order("created_at DESC")
#    elsif params[:search]
#      @questions = Question.search_for(params[:search]).order("created_at DESC")
#    else
#     @questions = Question.all.order("created_at DESC")
#    end
#  end
#
#
#   def new
#       @question = Question.new
#   end
#
#
#   def create
#     @question = Question.new(question_params)
#     @question.user = current_user
#
#     if @question.save
#       redirect_to @question, notice: "question was saved successfully."
#     else
#       flash.now[:alert] = "Error. Try again."
#       render :new
#     end
#
#   end
#
#
#   def edit
#       @question = Question.find(params[:id])
#       authorize_edit(@question)
#   end
#
#   def update
#
#     @question = Question.find(params[:id])
#     authorize_edit(@question)
#
#     @question.assign_attributes(question_params)
#
#     if @question.save
#        flash[:notice] = "Question was updated."
#       redirect_to @question
#     else
#       flash.now[:alert] = "Error updating question. Please try again."
#       render :edit
#     end
#
#   end
#
#   def destroy
#     @question = Question.find(params[:id])
#     authorize_edit(@question)
#
#     if @question.destroy
#       flash[:notice] = "Question was successfully deleted."
#       redirect_to action: :index
#     else
#       flash.now[:alert] = "There was an error deleting the question."
#       render :show
#     end
#   end
#
#
#   def show
#     @question = Question.find(params[:id])
#   end
#
#
#   # def threads
#   #   @threads = current_user.threads
#   # end
#
#
#
#   private
#
# # what information can requrests pass into our question objects
#    def question_params
#      params.require(:question).permit(:title,:body,:all_tags,:file,:image)
#    end
#
#     # def authorize_user
#     #   unless current_user.admin?
#     #     flash[:alert] = "You must be an admin to do that."
#     #     redirect_to questions_path
#     #   end
#     # end
#
#     def authorize_edit(question)
#         unless current_user == question.user || current_user.admin?
#           flash[:alert] = "You must own the question."
#           redirect_to questions_path
#         end
#     end
#
#
# end
