
#System constants

::SUPERUSERS = ['ForeverYoung','admin']  
::ADMIN_ROLE_ID = 1
::USER_ROLE_ID = 2
::ACCOUNTANT_ROLE_ID = 3
::MAIL_TO_ID = 4 #for mailing and system notification purposes

#My service patches

# class TrueClass
#   def yesno
#     "Так"
#   end
# end

# class FalseClass
#   def yesno
#     "Ні"
#   end
# end

#System jobs setup
# MorningCheckJob.set(wait: 5.seconds).perform_later("xxx")

MorningCheckJob.set(wait_until: Date.tomorrow.beginning_of_day).perform_later

