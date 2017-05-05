class Contract < ApplicationRecord
  belongs_to :type
  belongs_to :payer, class_name: :Company
  belongs_to :recipient, class_name: :Company
  belongs_to :responsible_user
  belongs_to :creator_user

  # has_one :type
  # has_one :payer
  # has_one :recipient
  # has_one :responsible_user
  # has_one :creator_user
end
