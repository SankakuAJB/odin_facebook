class Friend < ActiveRecord::Base

	belongs_to :

	validates_presence_of :user_id, :friend_id
	validates_uniqueness_of :user_id, :scope => [:friend_id]


end
