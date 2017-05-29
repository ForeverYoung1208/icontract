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
		@responsible_user = User.find(2)


		@contract=Contract.create( attributes_for(:contract,
	    type: @types[0],
	    payer: @companies[0],
	    recipient: @companies[1],
	    responsible_user: @responsible_user,
	    responsible_user_name: @responsible_user.name,
	    creator_user: @creator_user,
	    creator_user_name: @creator_user.name,
		) )

		@reminder_types=[
		    ReminderType.where(id:1).first_or_create(
		        name: "Щотижнево",
		        description: "reminder_description1"
		    ), 
		    ReminderType.where(id:2).first_or_create(
		        name: "Щомісячно",
		        description: "reminder_description2"
		    ),
		    ReminderType.where(id:3).first_or_create(
		        name: "Щоквартально",
		        description: "reminder_description3"
		    ),
		    ReminderType.where(id:4).first_or_create(
		        name: "Щорічно",
		        description: "reminder_description4"
		    )
		]


		@reminders = Array.new(4){ |i| Reminder.create!( attributes_for(:reminder, 
			reminder_type: @reminder_types[i], #1..4
			reminderable: @contract,
	    dd: "2",
	    mm: "2",
	    yyyy: "2017",
	    dofw: "1"
		)) } 


	end


	it "contract must have type, payer, recipient, creator, responsible_user names" do
		expect( @contract.type.name ).to eq('type_name0')
		expect( @contract.payer.name ).to eq('company_name0')
		expect( @contract.recipient.name ).to eq('company_name1')
	end


	it "contract 'enerate_next_events' with given date 24.05.2017 must generate events with all reminders" do

		expect( @contract.reminders.size).to eq(4)

		@contract.generate_next_events('24.05.2017')

		expect( @contract.reminders[0].events[0].on_date.strftime("%d.%m.%Y") ).to eq( '29.05.2017' )
		expect( @contract.reminders[1].events[0].on_date.strftime("%d.%m.%Y") ).to eq( '02.06.2017' )
		expect( @contract.reminders[2].events[0].on_date.strftime("%d.%m.%Y") ).to eq( '02.08.2017' )
		expect( @contract.reminders[3].events[0].on_date.strftime("%d.%m.%Y") ).to eq( '02.02.2018' )
	end


end