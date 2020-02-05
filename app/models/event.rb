class Event < ApplicationRecord
    has_many :creator, class_name: :user
end
