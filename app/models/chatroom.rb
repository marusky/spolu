class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :team, optional: true

  has_and_belongs_to_many :users

  def name(current_user)
    team&.name || (users - [current_user]).first&.name
  end
end
