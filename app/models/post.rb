class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}


  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  #validates :genre, inclusion: { in: ['Action', 'Science Fiction', 'Drama', 'Horror', 'Comedy', 'Musical'] }
  #%w converts into an array 

  #custom validation
  validate :title_is_clickbait 

  def title_is_clickbait
     valids = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
      if valids.none?{|par| par.match title}
      errors.add(:title, "not clickbait")
      end
  end
end

