class Book < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true, length: { maximum: 140 }

	belongs_to :user
end
