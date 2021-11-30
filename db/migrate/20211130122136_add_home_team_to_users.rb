class AddHomeTeamToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :home_team, :integer
  end
end
