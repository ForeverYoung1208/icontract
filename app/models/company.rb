class Company < ApplicationRecord
	has_many :contracts_payer, class_name: :Contract, foreign_key: :payer_id
	has_many :contracts_recipient, class_name: :Contract, foreign_key: :recipient_id

	validates :edrpou, uniqueness: {scope: [:deleted_at]}

  default_scope { where("deleted_at IS NULL")}

  def name_edrpou
  	"#{name} (#{edrpou})"
  end
		
end
