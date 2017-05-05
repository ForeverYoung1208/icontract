class Company < ApplicationRecord
	has_many :as_payer, class_name: :Contract
	has_many :as_recipient, class_name: :Contract
end
