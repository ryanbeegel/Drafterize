class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|

      t.string :name
      t.integer :rounds
      t.float :minutes_per_round

      t.timestamps
    end
  end
end
