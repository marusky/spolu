class Team < ApplicationRecord
  belongs_to :leader, class_name: 'User', foreign_key: 'leader_id'
  has_and_belongs_to_many :members, class_name: 'User'
  has_many :team_invitations
  has_many :invited_users, through: :team_invitations, source: :user
  has_many :notes
  has_many :meetings
  has_many :events

  has_many :subteams, class_name: 'Team', foreign_key: 'superteam_id'
  belongs_to :superteam, class_name: 'Team', optional: true

  def next_meeting
    meetings.where('date > ?', DateTime.now - 30.minutes).order(date: :asc).first
  end

  def next_event
    events.where('start > ?', DateTime.now).order(start: :asc).first
  end

  def chattable(current_user)
    members - [current_user] + subteams + [self]
  end

  def all_teams
    if self.superteam_id.nil?
      [self] + subteams
    else
      [self.superteam] + self.superteam.subteams
    end
  end

  def is_superteam?
    superteam.nil?
  end
end

