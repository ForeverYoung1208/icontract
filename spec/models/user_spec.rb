require 'rails_helper'

RSpec.describe User, type: :model do
	before :each do

		@types = []
		@companies = []
		3.times do |i|
			@types << Type.create(
		    name: "type_name#{i}",
		    typical_contract_name: "typical_contract_name#{i}"
			)
			@companies << Company.create(
		    name: "company_name#{i}",
		    address: "company_address#{i}",
		    edrpou: "company_edrpou1#{i}"
			)
		end

		@creator_user = User.find(1)
		@creator_user.name = 'user1'
		@responsible_user = User.find(2)
		@responsible_user.name = 'user2'


		@contract=Contract.create(

	    name: 'contract1',
	    number: 'number1',
	    sum: '11.22',
	    from_date: '06.05.2017',
	    to_date: '10.05.2017',
	    till: 'cpecified date',
	    is_signed: true,
	    is_active: true,
	    is_deleted: false,
	    acts_schedule: 'acts_schedule1',
	    payments_schedule: 'payments_schedule1',
	    scan_path: 'scan_path1',
	    text_path: 'text_path1',

	    type: @types[0],
	    payer: @companies[0],
	    recipient: @companies[1],
	    responsible_user: @responsible_user,
	    responsible_user_name: @responsible_user.name,
	    creator_user: @creator_user,
	    creator_user_name: @creator_user.name,
	    preferences: 'none'

		) 

	end

	it "creator_user responsible_user must have contract " do
		expect( @creator_user.contracts_creator[0].name).to eq('contract1')
		expect( @responsible_user.contracts_creator.size).to eq(0)


		expect( @creator_user.contracts_responsible.size).to eq(0)
		expect( @responsible_user.contracts_responsible[0].name).to eq('contract1')

	end


end