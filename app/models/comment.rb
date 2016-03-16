class Comment < ActiveRecord::Base

	validates :content, presence: true,
						length: {maximum: 125}
	validates :user_id, presence: true
	validates :post_id, presence: true

	belongs_to :post 
	belongs_to :user 
	
end
