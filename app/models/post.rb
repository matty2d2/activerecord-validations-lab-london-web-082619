class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :is_clickbait?



    def is_clickbait?
        if !(title && title.include?("Won't Believe" || "Secret" || "Top" || "Guess"))
            errors.add(:title, "must be clickbait")
        end
    end
end
