class AddSuperteamIdToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :superteam_id, :integer
  end
end
