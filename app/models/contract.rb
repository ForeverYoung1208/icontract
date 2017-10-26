class Contract < Reminderable

  # include Reminderable

  belongs_to :type
  belongs_to :payer, class_name: :Company, foreign_key: :payer_id
  belongs_to :recipient, class_name: :Company, foreign_key: :recipient_id
  belongs_to :responsible_user, class_name: :User, foreign_key: :responsible_user_id
  belongs_to :creator_user, class_name: :User, foreign_key: :creator_user_id
  has_many :akts

  validates :from_date, presence: true
  validates :sum, presence: true
  validates :number, presence: true
  validates :name, presence: true


  # moved to Reminderable class
  # has_many :reminders, as: :reminderable
  # default_scope { where("#{table_name}.deleted_at IS NULL")}

  # mount_uploaders :scanfiles, ScanContractUploader
  # serialize :scanfiles, JSON

  # mount_uploaders :textfiles, TextContractUploader
  # serialize :textfiles, JSON


  def doctype 
  	'Договір'
  end

  def name
    is_deleted ? "!Видалений #{deleted_at.strftime("%d.%m.%Y")}! #{ super }" : super
  end

  def extended_info
    from_date ? from_date_str = " від "+from_date.strftime("%d.%m.%Y") : from_date_str = " без дати "
    res = name + ' № ' + number.to_s + from_date_str + " (#{responsible_user.name})"
  end

end
