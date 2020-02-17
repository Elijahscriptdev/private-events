# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :user_events, foreign_key: "event_id"
  has_many :attendees, through: :user_events, source: :user
  scope :upcoming, -> { where('event_date > ?', Time.zone.now) }
  scope :past, -> { where('event_date <= ?', Time.zone.now) }

  validates :event_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :event_date, presence: true
  validates :location, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 3, maximum: 250 }
end
