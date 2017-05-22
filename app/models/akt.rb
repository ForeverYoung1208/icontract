class Akt < ApplicationRecord
  belongs_to :contract
  
  has_many :reminders, as: :reminderable

end
