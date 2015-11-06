class Like < ActiveRecord::Base
  belongs_to :pastor
  belongs_to :sermon
  
  validates_uniqueness_of :pastor, scope: :sermon 
end
