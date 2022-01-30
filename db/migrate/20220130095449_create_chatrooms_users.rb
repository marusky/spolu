class CreateChatroomsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :chatrooms_users, id: false do |t|
      t.integer :chatroom_id
      t.integer :user_id

      t.timestamps
    end
  end
end
