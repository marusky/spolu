class AddLeaderIdToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :leader_id, :integer
  end
end
