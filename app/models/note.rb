class Note < ApplicationRecord
  belongs_to :team
  belongs_to :creator, class_name: 'User'
  belongs_to :updater, class_name: 'User', optional: true
end
