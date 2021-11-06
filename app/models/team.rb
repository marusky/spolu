class Team < ApplicationRecord
  belongs_to :leader, class_name: 'User', foreign_key: 'leader_id'
  has_and_belongs_to_many :members, class_name: 'User'
end
