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

  def is_deleted
    return deleted_at != nil
  end

  def take_untake!(by_user)
    
    self.is_taken_as_original = !is_taken_as_original;
    if self.is_taken_as_original   
      self.preferences="#{self.preferences} Прийнято "+ DateTime.now.strftime("%d.%m.%Y")+" користувачем #{by_user.name}."
    else
      self.preferences="#{self.preferences} Відмінено прийняття "+ DateTime.now.strftime("%d.%m.%Y")+" користувачем #{by_user.name}."
    end
    self.save


    is_taken_as_original
  end


  
  mount_uploaders :scanfiles, ScanReminderableUploader
  serialize :scanfiles, JSON

  mount_uploaders :textfiles, TextReminderableUploader
  serialize :textfiles, JSON
  

end
