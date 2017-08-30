class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.will_be_joined_across_databases!

  	debugger

    self.table_name = "#{connection.current_database}.#{table_name}"

    

  end

end
