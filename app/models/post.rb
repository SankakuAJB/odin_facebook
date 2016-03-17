class Post < ActiveRecord::Base

	validates :content, presence: true,
						length: {maximum: 250}
	validates :user_id, presence: true

	belongs_to :user 
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	
end
