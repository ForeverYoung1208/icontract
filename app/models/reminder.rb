class Reminder < ApplicationRecord
  belongs_to :reminder_type
  belongs_to :reminderable, polymorphic: true, optional: true
  belongs_to :user
  has_many :events

  # wtf???
  # has_many :akts

  default_scope { where("deleted_at IS NULL")}

  def check
  end

  def generate_next_event(given_date_string)
    given_date = given_date_string.to_date

    case reminder_type_id
    when 0 # never
      print 'never'

    when 1 # weekly
      needed_date = given_date
      needed_date += 1.day until needed_date.wday == dofw
    when 2 # monthly
      needed_date = ("#{dd}.01.2017").to_date
      needed_date += 1.month while needed_date < given_date
    when 3 #quarterly
      needed_date = ("#{dd}.#{mm}.2016").to_date
      needed_date += 3.month while needed_date < given_date
    when 4 #yearly
      needed_date = ("#{dd}.#{mm}.2016").to_date
      needed_date += 12.month while needed_date < given_date
    else
      raise "Помилка: Невідомий тип події"
    end

    begin
      event = Event.create!(
        reminder: self,
        user: user,
        is_sent: false,
        to_send: true,
        email_address: user.email,
        email_text: "Нагадування: #{message} для #{reminderable.responsible_user.name}, #{reminderable.doctype} від #{reminderable.from_date.strftime("%d.%m.%Y")} (id: #{reminderable.id}), #{self.reminder_type.name} ",
        on_date: needed_date
      )  
    rescue ActiveRecord::RecordInvalid => err
      # if err.message =~ /Validation failed.*/
        
      # end
    ensure
      return event
    end

    
  end




end
