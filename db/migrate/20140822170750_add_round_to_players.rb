class AddRoundToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :round, :integer
  end
end
