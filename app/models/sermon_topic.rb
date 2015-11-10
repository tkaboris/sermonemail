class SermonTopic < ActiveRecord::Base
  belongs_to :sermon
  belongs_to :topic
end