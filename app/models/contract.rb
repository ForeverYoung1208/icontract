class Contract < ApplicationRecord
  belongs_to :type
  belongs_to :payer
  belongs_to :recipient
  belongs_to :responsible_user
  belongs_to :creator_user
end
