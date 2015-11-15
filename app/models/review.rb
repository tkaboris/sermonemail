class Review < ActiveRecord::Base
  belongs_to :pastor
  belongs_to :sermon
  validates :pastor_id, presence: true
  validates :body, presence: true, length: { minimum: 2, maximum: 100 } 
  
  validates_uniqueness_of :pastor, scope: :sermon
   
   scope :find_review, lambda {|c,r| where(pastor: c, sermon: r)}
  
end