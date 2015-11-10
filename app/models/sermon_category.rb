class SermonCategory < ActiveRecord::Base
  belongs_to :sermon
  belongs_to :category
end