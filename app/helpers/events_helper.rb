# frozen_string_literal: true

module EventsHelper
  def create_event_button
    return unless logged_in?

    link_to 'Create Event', new_event_path, class: 'btn btn-secondary text-white'
  end
end
