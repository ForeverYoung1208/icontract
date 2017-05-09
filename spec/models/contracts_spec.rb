require 'rails_helper'

RSpec.describe Contract, type: :model do
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


	it "contract must have type, payer, recipient, creator, responsible_user names" do
		expect( @contract.type.name ).to eq('type_name0')
		expect( @contract.payer.name ).to eq('company_name0')
		expect( @contract.recipient.name ).to eq('company_name1')
		expect( @contract.creator_user.name ).to eq('user1')
		expect( @contract.responsible_user.name ).to eq('user2')
	end

end