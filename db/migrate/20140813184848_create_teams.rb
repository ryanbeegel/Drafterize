class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.text :name
      t.references :draft, index: true

      t.timestamps
    end
  end
end
