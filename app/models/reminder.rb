class Reminder < ApplicationRecord
  belongs_to :reminder_type
  belongs_to :reminderable, polymorphic: true, optional: true
  belongs_to :user
  has_many :events

  validate :check_presence_of_needed_days, on: [:create, :save, :update]
  after_save ->{ generate_next_event( DateTime.now.beginning_of_day ) unless deleted_at}

  # wtf???
  # has_many :akts

  default_scope { where("deleted_at IS NULL")}

  def check_presence_of_needed_days
    case reminder_type_id
    when 1 # weekly
      errors.add(:dofw, "Вкажіть номер дня тижня") unless dofw.between?(1,7)
    when 2 # monthly
      errors.add(:dd, "Вкажіть номер дня місяця") unless dd.between?(1,31)
    when 3 #quarterly
      errors.add(:dd, "Вкажіть номер дня місяця") unless dd.between?(1,31)
      errors.add(:mm, "Вкажіть номер місяця") unless mm.between?(1,12)
    when 4 #yearly
      errors.add(:dd, "Вкажіть номер дня місяця") unless dd.between?(1,31)
      errors.add(:mm, "Вкажіть номер місяця") unless mm.between?(1,12)
    else
      raise "Помилка: Невідомий тип події"
    end    

  end

  def self.all_generate_events(given_date_string)
    created_events_ids = []
    Reminder.all.each do |r|
      created_event = r.generate_next_event(given_date_string)
      created_event ? created_events_ids << created_event.id : created_events_ids << 0
    end
    return created_events_ids
  end

  def activeness
    is_active ? (return "") : (return "(Неактивно)")
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
      if needed_date <= ends
        event = Event.create!(
          reminder: self,
          user: user,
          sent_times: 0,
          to_send: true,
          email_address: user.email,
          email_text: "Нагадування: #{message} для #{reminderable.responsible_user.name}, #{reminderable.doctype} від #{reminderable.from_date.strftime("%d.%m.%Y")} (id: #{reminderable.id}), #{self.reminder_type.name} ",
          on_date: needed_date
        ) 
        event.send_email
      end
    rescue ActiveRecord::RecordInvalid => err
      # if err.message =~ /Validation failed.*/
        
      # end
    ensure
      return event
    end

    
  end


end
