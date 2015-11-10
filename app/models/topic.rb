class Topic < ActiveRecord::Base
      validates :name, presence: true, length: { minimum: 2, maximum: 25 }  
      has_many :sermon_topics
      has_many :sermons, through: :sermon_topics
end