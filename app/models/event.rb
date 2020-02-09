class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    has_many :attendee, class_name: "Attendance", foreign_key: "attended_event_id" 
end
