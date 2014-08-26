class PlayersController < ApplicationController
  before_action :set_draft
  def create
    @player = Player.new(params.require(:player).permit(:name))
     
    drafting_team = @draft.teams[@draft.team_position - 1]
    @player.team = drafting_team

    if @player.save 
      flash[:notice] = "#{@player.name} added to #{drafting_team.name}"
    else
      flash[:error] = "There was a problem saving this player"
    end

    redirect_to @draft
  end

  private

  def set_draft
    @draft = Draft.find(params[:draft_id])
  end


end
