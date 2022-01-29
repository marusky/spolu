class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :team, optional: true
end
