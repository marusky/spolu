class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.integer :team_id
      t.integer :creator_id
      t.integer :updater_id

      t.timestamps
    end
  end
end
