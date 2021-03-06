class Api::V1::GroupsController < ApiController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    respond_with :api, :v1, Group.all
  end

  def create
      group = Group.create(group_params)
      group.users.push(current_user)
      puts group.users.inspect
      respond_with :api, :v1, group
  end 

   def show
     respond_with :api, :v1, Group.find(params[:id])
   end


# creates another hash that is strong PARAMETERIZED, FILTERED for MASS ASSIGNMENT.
   private
   def group_params
      params.require(:group).permit(:topic, :description)
   end


end
