class Pastor < ActiveRecord::Base
  has_many :sermons
  has_many :likes
  #email valid regular expression:
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   
   validates :pastorname, presence: true, length: { in: 2..50 }
   validates :email,    presence: true, length: { maximum: 100 }, 
                        uniqueness: { case_sensitive:false }, 
                        format:  { with: VALID_EMAIL_REGEX }
                        
    has_secure_password
end
