class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :teams
  has_many :team_invitations
  has_many :joinable_teams, through: :team_invitations, source: :team
  has_many :notes, foreign_key: 'creator_id'

  has_and_belongs_to_many :meetings
  has_many :attendances

  has_many :messages

  has_and_belongs_to_many :chatrooms
  def name
    "#{first_name} #{last_name}"
  end

  def can_manage_team?(team_id)
    if Team.exists?(team_id)
      Team.find(team_id).members.include? self
    else
      false
    end
  end

  def attends(meeting)
    Attendance.find_by(user: self, meeting: meeting)&.answer
  end

end
