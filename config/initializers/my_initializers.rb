
#System constants

::SUPERUSERS = ['ForeverYoung','admin']  
::ADMIN_ROLE_ID = 1
::USER_ROLE_ID = 2
::ACCOUNTANT_ROLE_ID = 3
::MAIL_TO_ID = 4 #for mailing and system notification purposes

#My service patches

class TrueClass
  def yesno
    "Так"
  end
end

class FalseClass
  def yesno
    "Ні"
  end
end