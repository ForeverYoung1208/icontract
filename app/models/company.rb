class Company < ApplicationRecord
	has_many :contracts_payer, class_name: :Contract
	has_many :contracts_recipient, class_name: :Contract
end
