require 'rails_helper'

RSpec.describe Reminder, type: :model do
	before :each do

		@type = Type.create( attributes_for(:type) )
		@company1 = Company.create( attributes_for(:company, name: 'name1') )
		@company2 = Company.create( attributes_for(:company, name: 'name2') )
		@creator_user = User.find(1)
		@responsible_user = User.find(2)


		@contract=Contract.create( attributes_for(:contract,
	    type: @type,
	    payer: @company1,
	    recipient: @company2,
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

  it "reminders should be 4" do
		print "\n----------\n"
  	@reminders.each{ |r| print r.inspect+"\n--------------\n"}
		print "\n----------\n"
  	expect(@reminders.size).to eq(4)
  end

  it "first reminder -weekly, with given date '24.05.2017' must create event on 29.05.2017" do
  	event = @reminders[0].generate_next_event('24.05.2017')
  	expect(event.on_date.strftime("%d.%m.%Y") ).to eq( '29.05.2017' )
  end

  it "first reminder -weekly, with given date  must create event on " do
  	event = @reminders[0].generate_next_event('30.05.2017')
  	expect(event.on_date.strftime("%d.%m.%Y") ).to eq( '05.06.2017' )
  end


  it "second reminder -monthly, with given date '01.05.2017' must create event on 02.05.2017" do
  	event = @reminders[1].generate_next_event('01.05.2017')
  	expect(event.on_date.strftime("%d.%m.%Y") ).to eq( '02.05.2017' )
  end

  it "second reminder -monthly, with given date '24.05.2017' must create event on 02.06.2017" do
  	event = @reminders[1].generate_next_event('24.05.2017')
  	expect(event.on_date.strftime("%d.%m.%Y") ).to eq( '02.06.2017' )
  end

  it "second reminder -monthly, with dd=29 and given date '30.01.2017' must create event on 28.02.2017" do
  	@reminders[1].dd="29"
  	event = @reminders[1].generate_next_event('30.01.2017')
  	expect(event.on_date.strftime("%d.%m.%Y") ).to eq( '28.02.2017' )
  end



  xit "third reminder -quoterly, with given date '24.05.2017' must create event on 24.08.2017" do
  	event = @reminders[2].generate_next_event('24.05.2017')
  	expect(event.on_date.strftime("%d.%m.%Y") ).to eq( '24.08.2017' )
  end

  xit "fourth reminder -yearly, with given date '24.05.2017' must create event on 24.05.2018" do
  	event = @reminders[3].generate_next_event('24.05.2017')
  	expect(event.on_date.strftime("%d.%m.%Y") ).to eq( '24.05.2018' )
  end


end
