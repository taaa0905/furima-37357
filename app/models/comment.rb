class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  validates :content, length: { minimum: 1, maximum: 200 }
end