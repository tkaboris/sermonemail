class Sermon < ActiveRecord::Base
  belongs_to :pastor
  has_many :likes, dependent: :destroy
  has_many :sermon_topics, dependent: :destroy
  has_many :topics, through: :sermon_topics
  has_many :sermon_categories, dependent: :destroy
  has_many :categories, through: :sermon_categories
  has_many :reviews, dependent: :destroy
  validates :pastor_id, presence: true 
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 10, maximum: 150 }
  validates :description, presence: true, length: { minimum: 20, maximum: 500 }
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  
  default_scope -> { order(updated_at: :desc)}
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  def pastor_reviews(c)
       self.reviews.where(pastor: c)
  end
  
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "Image should be less than 5MB")
      end
    end
    
end
