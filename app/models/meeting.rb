class Meeting < ApplicationRecord
  belongs_to :team
  has_and_belongs_to_many :users

  has_many :attendances

  def display_date
    "#{date.strftime('%A').slice(0, 3)}, #{date.strftime('%d %b %Y')}"
  end

  def display_time
    date.strftime('%H:%M')
  end
end

