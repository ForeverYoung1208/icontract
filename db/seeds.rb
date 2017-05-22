# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.all

companies = Company.create([{
  	name: "company_name1",
    address: "company_address1",
    edrpou: "12345678",
  }, {
  	name: "company_name2",
    address: "company_address2",
    edrpou: "22345678",
}])

types = Type.create([{
	  name: "type_name1",
	  typical_contract_name: "typical_contract_name1"
  }, {
	  name: "type_name1",
	  typical_contract_name: "typical_contract_name1"
}])

reminder_types = ReminderType.create([{
	  name: "reminder_type_name1",
	  description: "reminder_description1"
  }, {
	  name: "reminder_type_name1",
	  description: "reminder_description1"
}])



reminders = Reminder.create([{
		reminder_type: reminder_types[0],
		dd: "21",
		mm: "11",
		yyyy: "2017",
		dofw: "1",
		moq: "1",
		begins: "01.01.2017",
		ends: "21.12.2017",
		is_active: true
	} ,{
		reminder_type: reminder_types[1],
		dd: "22",
		mm: "12",
		yyyy: "2017",
		dofw: "2",
		moq: "2",
		begins: "02.02.2017",
		ends: "22.12.2017",
		is_active: true
}])

contracts = Contract.create([{
    name: "contract_name1",
    number: "№1",
    sum: "888.88",
    from_date: "11.05.2017",
    to_date: "11.05.2018",
    till: "выполнения сторонами обязательств1",
    is_signed: true,
    is_active: true,
    is_deleted: false,
    acts_schedule: "acts_schedule1",
    payments_schedule: "payment_schedule1",
    scan_path: "/contracts/scan/contract1.pdf",
    text_path: "/contracts/text/contract1.doc",
    type: types[0],
    payer: companies[0],
    recipient: companies[1],
    responsible_user: users[0],
    responsible_user_name: users[0].name,
    creator_user: users[1],
    creator_user_name: users[1].name,
    preferences: "preferences1"
  }, {
    name: "contract_name2",
    number: "№2",
    sum: "777.77",
    from_date: "22.05.2017",
    to_date: "22.05.2018",
    till: "выполнения сторонами обязательств2",
    is_signed: true,
    is_active: true,
    is_deleted: false,
    acts_schedule: "acts_schedule2",
    payments_schedule: "payment_schedule2",
    scan_path: "/contracts/scan/contract2.pdf",
    text_path: "/contracts/text/contract2.doc",
    type: types[1],
    payer: companies[1],
    recipient: companies[0],
    responsible_user: users[1],
    responsible_user_name: users[1].name,
    creator_user: users[0],
    creator_user_name: users[0].name,
    preferences: "preferences2"
}])

akts = Akt.create([{
    contract: contracts[0],
    from_date: "20.05.2017",
    sum: "222.22",
    scan_path: "/akts/scan/contract2.pdf",
    text_path: "/akts/text/contract2.doc",
    is_signed: false,
    is_deleted: false,
    is_taken_as_original: true
  }, {
    contract: contracts[1],
    from_date: "20.05.2017",
    sum: "222.22",
    scan_path: "/akts/scan/contract2.pdf",
    text_path: "/akts/text/contract2.doc",
    is_signed: false,
    is_deleted: false,
    is_taken_as_original: true
}])

