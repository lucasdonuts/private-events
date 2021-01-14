class Invitation < ApplicationRecord
  enum status: { invited: 0, accepted: 1 }
  belongs_to :event
  belongs_to :attendee, class_name: 'User'
end