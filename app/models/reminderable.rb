class Reminderable < ApplicationRecord
  self.abstract_class = true
  has_many :reminders, as: :reminderable  
  default_scope { where("#{table_name}.deleted_at IS NULL")}  



  def check_reminders( given_date )
    reminders.each { |r| r.generate_next_event(given_date) }
  end

  def doctype 
    'Reminderable'
  end

  def is_deleted
    return deleted_at != nil
  end
  
end
