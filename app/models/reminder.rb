class Reminder < ApplicationRecord
  belongs_to :reminder_type

  belongs_to :reminderable, polymorphic: true, optional: true

  def check
  end

  def get_next_event(given_date)
  	case reminder_type_id
  	when 0
  		print 'daily'
  	when 1
  		print 'weekly'

  	else
  		raise "Помилка: Невідомий тип події"
  	end
  		
  		

  end




end
