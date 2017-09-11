class Akt < ApplicationRecord
  belongs_to :contract
  
  has_many :reminders, as: :reminderable

  def doctype 
  	'Акт'
  end

  #I think in future akt will have its own responsible user
  #look also at akts_controller#mine
  delegate :responsible_user, to: :contract
  
end
