require 'rails_helper'

RSpec.describe Contract, type: :model do
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

		# @section1=Section.find_by_name("service_section1")
		# @section2=Section.find_by_name("service_section2")
		# @user.sections<<@section1
		# @user.save

		# @admin=FactoryGirl.create(:user) 
		# @admin.sections=Section.all
	end

	it "contract must have type, payer, recipient, creator, responsible_user names" do
		@contract.type.name.should == 'type_name0'
		@contract.payer.name.should == 'company_name0'
		@contract.recipient.name.should == 'company_name1'
		@contract.creator_user.name.should == 'user1'
		@contract.responsible_user.name.should == 'user2'
	end


	# it "user should be redactor for section1" do
	# 	@user.redactor?( @section1 ).should be_true
	# end

	# it "user should NOT be redactor for section2" do
	# 	@user.redactor?( @section2 ).should_not be_true
	# end

	# it "should raise an exception when the 'nil' given for redactor check" do
	# 	expect { @user.redactor?(nil) }.to raise_error('no section given')
	# end


	# it "admin should respond true on admin?" do
	# 	@admin.admin?.should be_true
	# end


end