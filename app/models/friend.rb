class Friend < ActiveRecord::Base

	belongs_to :user 

	validates_presence_of :user_id, :friend_id, :status
	validates_uniqueness_of :user_id, :scope => [:friend_id, :status]

end
