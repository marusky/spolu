class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :user
      t.belongs_to :meeting
      t.boolean :answer
      t.timestamps
    end
  end
end
