class AddCountersToDrafts < ActiveRecord::Migration
  def change
    add_column :drafts, :current_round, :integer, default: 1
    add_column :drafts, :team_position, :integer, default: 1
  end
end
