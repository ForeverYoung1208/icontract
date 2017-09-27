module ApplicationCable

  class Connection < ActionCable::Connection::Base
    identified_by :current_user_id
 
    def connect
      self.current_user_id = find_verified_user_id
    end
 


    private

    def find_verified_user_id
      if current_user_id = cookies.signed[:current_user_id]
        current_user_id
      else
        reject_unauthorized_connection
      end
    end
    
  end

end
