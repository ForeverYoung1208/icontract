# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.all


roles_user = [
    Roles.where(id: ::ADMIN_ROLE_ID).first_or_create(
        name: "Адмін"
    ),
    Roles.where(id: ::USER_ROLE_ID).first_or_create(
        name: "Користувач"
    ),
    Roles.where(id: ::ACCOUNTANT_ROLE_ID = 3).first_or_create(
        name: "Бухгалтер"
    )

]

# Production setup values
companies =[
    Company.where(edrpou:"12345678").first_or_create(
      	name: "company_name1",
        address: "company_address1",
        edrpou: "12345678"
    ), 
    Company.where(edrpou:"22345678").first_or_create(
        name: "company_name2",
        address: "company_address2",
        edrpou: "22345678"
    )
]

reminder_types=[
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


# Development and testing values
types = [
    Type.where(id:1).first_or_create(
    	name: "type_name1",
    	typical_contract_name: "typical_contract_name1"
    ), 
    Type.where(id:2).first_or_create(
        name: "type_name2",
        typical_contract_name: "typical_contract_name2"
    )
]


contracts = [
    Contract.where(id:1).first_or_create(
        name: "contract_name1",
        number: "№1",
        sum: "888.88",
        from_date: "11.05.2017",
        to_date: "11.05.2018",
        till: "выполнения сторонами обязательств1",
        is_signed: true,
        is_active: true,
        is_deleted: false,
        type: types[0],
        payer: companies[0],
        recipient: companies[1],
        responsible_user: users[0],
        responsible_user_name: users[0].name,
        creator_user: users[1],
        creator_user_name: users[1].name,
        preferences: "preferences1"
    ), 
    Contract.where(id:2).first_or_create(
        name: "contract_name2",
        number: "№2",
        sum: "777.77",
        from_date: "22.05.2017",
        to_date: "22.05.2018",
        till: "выполнения сторонами обязательств2",
        is_signed: true,
        is_active: true,
        is_deleted: false,
        type: types[1],
        payer: companies[1],
        recipient: companies[0],
        responsible_user: users[1],
        responsible_user_name: users[1].name,
        creator_user: users[0],
        creator_user_name: users[0].name,
        preferences: "preferences2"
    )
]

akts = [
    Akt.where(id:1).first_or_create(
        contract: contracts[0],
        from_date: "20.05.2017",
        sum: "222.22",
        scan_path: "/akts/scan/contract2.pdf",
        text_path: "/akts/text/contract2.doc",
        is_signed: false,
        is_deleted: false,
        is_taken_as_original: true
    ), 
    Akt.where(id:2).first_or_create(
        contract: contracts[1],
        from_date: "20.05.2017",
        sum: "222.22",
        scan_path: "/akts/scan/contract2.pdf",
        text_path: "/akts/text/contract2.doc",
        is_signed: false,
        is_deleted: false,
        is_taken_as_original: true
    )
]


reminders = [
    Reminder.where(id:1).first_or_create(
        reminder_type: reminder_types[0],
        reminderable: contracts[0],
        dd: "21",
        mm: "11",
        yyyy: "2017",
        dofw: "1",
        moq: "1",
        begins: "01.01.2017",
        ends: "21.12.2017",
        message: "тестове нагадування1",
        is_active: true
    ),
    Reminder.where(id:2).first_or_create(
        reminder_type: reminder_types[1],
        reminderable: akts[0],
        dd: "22",
        mm: "12",
        yyyy: "2017",
        dofw: "2",
        moq: "2",
        begins: "02.02.2017",
        ends: "22.12.2017",
        message: "тестове нагадування2",        
        is_active: true
    )
]

