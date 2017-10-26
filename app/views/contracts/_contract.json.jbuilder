json.extract! contract, :id, :type_id, :name, :number, 
	:sum, :from_date, :to_date, :till, :payer_id, :recipient_id, 
	:is_signed, :is_active, :is_deleted, :responsible_user_id, 
	:creator_user_id, :scanfiles, :textfiles, :created_at, :updated_at, :deleted_at
json.url contract_url(contract, format: :json)
