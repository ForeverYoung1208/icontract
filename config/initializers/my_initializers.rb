# don't forget to set system environment variable
# export ICONTRACT_PROTOCOL=HTTPS
# if you are using https protocol


# System constants

::SUPERUSERS = ['ForeverYoung','admin']  
::ADMIN_ROLE_ID = 1
::USER_ROLE_ID = 2
::ACCOUNTANT_ROLE_ID = 3
::MAIL_TO_ID = 4 #for mailing and system notification purposes

# My service patches



# System jobs setup

MorningCheckJob.set(wait_until: Date.tomorrow.beginning_of_day).perform_later

