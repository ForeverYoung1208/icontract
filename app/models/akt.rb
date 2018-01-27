class Akt < Reminderable

  belongs_to :contract


  validates :kind, presence: true
  validates :from_date, presence: true
  validates :sum, presence: true
  validates :number, presence: true
  
  def doctype 
  	'Акт'
  end

  def extended_info
    from_date ? from_date_str = " від "+from_date.strftime("%d.%m.%Y") : from_date_str = " без дати "

    kind||=' '
    res =kind+ ' № ' +number.to_s + from_date_str + ' до дог. ' + contract.name + " від " + contract.from_date.strftime("%d.%m.%Y")
  end

  def name
    is_deleted ? "Удалён #{deleted_at.strftime("%d.%m.%Y")}! #{ doctype } от #{from_date.strftime("%d.%m.%Y")}" : "#{ doctype } от #{from_date.strftime("%d.%m.%Y")}"
  end  


  #I think in future akt will have its own responsible user
  #look also at akts_controller#mine
  delegate :responsible_user, to: :contract

  
end
