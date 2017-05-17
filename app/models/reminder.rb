class Reminder < ApplicationRecord
  belongs_to :reminder_type, class_name: :ReminderType
end
