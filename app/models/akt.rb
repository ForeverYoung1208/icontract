class Akt < ApplicationRecord
  belongs_to :contract
  
  has_many :reminders, as: :reminderable

  def doctype 
  	'Акт'
  end

end
