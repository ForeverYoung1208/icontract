class ReminderType < ApplicationRecord
	validates :name, uniqueness: true

	has_many :reminder
end
