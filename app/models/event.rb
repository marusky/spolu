class Event < ApplicationRecord
  belongs_to :team

  def days_until
    (start.to_time.to_i - Date.today.to_time.to_i) / (60 * 60 * 24)
  end

  def start_time
    start.strftime("%H:%M")
  end
end
