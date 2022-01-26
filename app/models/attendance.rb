class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :meeting

  scope :attendants, -> { where(answer: true) }
  scope :non_attendants, -> { where(answer: false) }
end
