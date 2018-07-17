class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def created
    created_at.to_i
  end
end
