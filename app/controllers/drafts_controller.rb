class DraftsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    # create draft
    @draft = Draft.new(params.require[:draft].permit[:name, :rounds, :num_of_minutes])
    # loop through teams submitted
    if @draft.save
      params[:team_name].each do |team_name|
        # create teams (check out accepts_nested_attributes_for)
        Team.create(name: team_name, draft: @draft) unless team_name.blank?
        flash[:notice] = "Draft created"
        redirect_to @draft
      end
    else
      flash[:error]= "Unable to create draft"
      render :new
    end
      
  end

end
