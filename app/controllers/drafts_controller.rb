class DraftsController < ApplicationController

  def show
    @draft = Draft.find(params[:id])
  end

  def new
    #if current_user
      #@draft = Draft.new
    #else
      #raise Pundit::NotAuthorizedError, "You must be logged in to create a new list."
    #end
  end

  def create
    # create draft
    @draft = Draft.new(params.require(:draft).permit(:name, :rounds, :num_of_minutes))
    # loop through teams submitted
    if @draft.save
      params[:team_name].each do |team_name|
        # create teams (check out accepts_nested_attributes_for)
        Team.create(name: team_name, draft: @draft) unless team_name.blank?       
      end
      flash[:notice] = "Draft created"
      redirect_to @draft
    else
      flash[:error]= "Unable to create draft"
      render :new
    end
      
  end

end