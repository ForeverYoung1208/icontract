module Reminderable
	extend ActiveSupport::Concern

  def check_reminders( given_date )
    reminders.each { |r| r.generate_next_event(given_date) }
  end

end