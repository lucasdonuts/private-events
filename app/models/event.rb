class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :invitations, foreign_key: 'event_id'
  has_many :attendees, through: :invitations

  scope :past, lambda { where('date < ?', Date.today).order(date: :desc) }
  scope :upcoming, lambda { where('date >= ?', Date.today).order(:date) }

  def past?
    self.date.past?
  end

  def future?
    self.date.future?
  end
end
