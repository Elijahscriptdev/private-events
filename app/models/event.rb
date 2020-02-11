class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"

    # has_many :attendee, through: :attendance, source: :attendee
    # has_many :attendance, class_name: "User"
    # belongs_to :attendee, class_name: "User"

end
