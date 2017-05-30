class Contract < ApplicationRecord
  belongs_to :type
  belongs_to :payer, class_name: :Company, foreign_key: :payer_id
  belongs_to :recipient, class_name: :Company, foreign_key: :recipient_id
  belongs_to :responsible_user, class_name: :User, foreign_key: :responsible_user_id
  belongs_to :creator_user, class_name: :User, foreign_key: :creator_user_id

  has_many :reminders, as: :reminderable

  has_many :akts

  def doctype 
  	'Договір'
  end

  def check_reminders( given_date )
    reminders.each { |r| r.generate_next_event(given_date) }
  end



end
