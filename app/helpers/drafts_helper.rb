module DraftsHelper
  def render_player_name_for_team_and_round(team, round)
    Rails.logger.info ">>>> Draft: #{team.draft.inspect}"
    Rails.logger.info ">>>> TEam: #{team.inspect}"
    Rails.logger.info ">>> players: #{team.players.inspect}"
    player = team.players.where(round: round).first
    Rails.logger.info ">>>> Player: #{player.inspect}"
    player ? player.name : ""
  end
end