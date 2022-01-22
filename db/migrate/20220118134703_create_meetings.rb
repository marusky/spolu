class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.string :name
      t.datetime :date
      t.string :place
      t.belongs_to :team

      t.timestamps
    end
  end
end
