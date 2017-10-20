class Akt < Reminderable

  belongs_to :contract
  
  def doctype 
  	'Акт'
  end

  def extended_info
    res = ' № ' +number.to_s + " від " + from_date.strftime("%d.%m.%Y") + ' до дог. ' + contract.name + " від " + contract.from_date.strftime("%d.%m.%Y")
  end

  def name
    is_deleted ? "Удалён #{deleted_at.strftime("%d.%m.%Y")}! #{ doctype } от #{from_date.strftime("%d.%m.%Y")}" : "#{ doctype } от #{from_date.strftime("%d.%m.%Y")}"
  end  

  def take_untake!
    is_taken_as_original = !is_taken_as_original;
    save!
  end


  #I think in future akt will have its own responsible user
  #look also at akts_controller#mine
  delegate :responsible_user, to: :contract

  
end
