class Like < ActiveRecord::Base

	validates_presence_of :user_id, :post_id
	validates_uniqueness_of :user_id, :scope => [:post_id]

	belongs_to :post
end
