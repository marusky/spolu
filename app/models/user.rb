class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :teams
  has_many :team_invitations
  has_many :joinable_teams, through: :team_invitations, source: :team

  def name
    "#{first_name} #{last_name}"
  end

  def can_invite_to_team?(team_id)
    if Team.exists?(team_id)
      Team.find(team_id).members.include? self
    else
      false
    end
  end
end
