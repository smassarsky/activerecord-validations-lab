class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: { maximum: 250 }
  validates :content, length: { minimum: 250 }
  validates :category, inclusion: ["Fiction", "Non-Fiction"]
  validate :clickbait

  def clickbait
    if title && !title.match(/Won't Believe|Secret|Top \d+|Guess/)
      errors.add(:clickbait, "not clickbaity enough")
    end
  end

end
