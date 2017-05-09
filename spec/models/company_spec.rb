require 'rails_helper'

RSpec.describe Company, type: :model do
	before :each do

		@types = []
		@companies = []
		3.times do |i|
			@types << Type.create( attributes_for(:type, name: "type_name#{i}") )
			@companies << Company.create( attributes_for(:company, name: "company_name#{i}" ) )
		end

		@creator_user = User.find(1)
		@creator_user.name = 'user1'
		@responsible_user = User.find(2)
		@responsible_user.name = 'user2'


		@contract=Contract.create( attributes_for(:contract,
	    type: @types[0],
	    payer: @companies[0],
	    recipient: @companies[1],
	    responsible_user: @responsible_user,
	    responsible_user_name: @responsible_user.name,
	    creator_user: @creator_user,
	    creator_user_name: @creator_user.name,
		) )

	end

	it "company must have ...  " do
		expect( @companies[0].contracts_payer[0].name).to eq('contract1')
		expect( @companies[0].contracts_payer.size).to eq(0)

		expect( @companies[1].contracts_creator[0].name.size ).to eq(0)
		expect( @companies[1].contracts_creator[0].name).to eq('contract1')

	end


end