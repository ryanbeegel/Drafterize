class Player < ActiveRecord::Base
  belongs_to :team

  after_create :update_draft_counters

  private

  def update_draft_counters
    draft = team.draft
    
    if draft.current_round.odd?
      if draft.team_position == draft.teams.count
        draft.current_round += 1
      else
        draft.team_position += 1 
      end
    else
      if draft.team_position == 1
        draft.current_round += 1
      else
        draft.team_position -= 1
      end
    end

    draft.save
  end
end
