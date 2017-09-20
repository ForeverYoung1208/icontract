class Akt < ApplicationRecord

  include Reminderable  

  belongs_to :contract
  
  has_many :reminders, as: :reminderable


  # look at Reminderable concern
  # def check_reminders( given_date )
  #   reminders.each { |r| r.generate_next_event(given_date) }
  # end
  
  def doctype 
  	'Акт'
  end

  def extended_info
    res = ' № ' +number.to_s + " від " + from_date.strftime("%d.%m.%Y") + ' до дог. ' + contract.name + " від " + contract.from_date.strftime("%d.%m.%Y")
  end


  #I think in future akt will have its own responsible user
  #look also at akts_controller#mine
  delegate :responsible_user, to: :contract
  
end
