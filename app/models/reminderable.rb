class Reminderable < ApplicationRecord
  self.abstract_class = true
  has_many :reminders, as: :reminderable  
  scope :notdeleted,-> { where("#{table_name}.deleted_at IS NULL")}  



  def check_reminders( given_date )
    reminders.each { |r| r.generate_next_event(given_date) }
  end

  def doctype 
    'Reminderable'
  end

  def extended_info
    'Undefined reminderable'
  end


  def is_deleted
    return deleted_at != nil
  end



  def take_untake!(by_user)
    
    self.is_taken_as_original = !is_taken_as_original;
    if self.is_taken_as_original   
      self.history="#{self.history} #{DateTime.now.strftime("%d.%m.%Y")}:Прийнято користувачем #{by_user.name}."
    else
      self.history="#{self.history} #{DateTime.now.strftime("%d.%m.%Y")}:Відмінено прийняття користувачем #{by_user.name}."
    end
    self.save


    is_taken_as_original
  end

  
  mount_uploaders :scanfiles, ScanReminderableUploader
  serialize :scanfiles, JSON

  mount_uploaders :textfiles, TextReminderableUploader
  serialize :textfiles, JSON
  

end
