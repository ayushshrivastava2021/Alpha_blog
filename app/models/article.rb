class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6, maximum: 300 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    belongs_to :user
    
end

