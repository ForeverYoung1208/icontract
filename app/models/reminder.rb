class Reminder < ApplicationRecord
  belongs_to :reminder_type

  belongs_to :reminderable, polymorphic: true    

end
