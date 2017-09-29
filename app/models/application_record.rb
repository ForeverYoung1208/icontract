class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :notdeleted,-> { where("TRUE")}  

  def next
    self.class.notdeleted.where("id > ?", id).first
  end

  def previous
    self.class.notdeleted.where("id < ?", id).last
  end  

end
