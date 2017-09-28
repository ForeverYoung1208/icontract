class Akt < Reminderable

  # include Reminderable  

  belongs_to :contract, -> { unscope(:where) }

  
  # has_many :reminders, as: :reminderable
  # default_scope { where("deleted_at IS NULL")}  
  
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
