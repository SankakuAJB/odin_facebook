class FriendsController < ApplicationController

	def new
	end

	def create
		@friendship1 = Friend.new
		@friendship2 = Friend.new
		@friendship1.attributes = {:user_id => current_user.id, :friend_id => params[:user_id], :status => 'requested'}
		@friendship2.attributes = {:user_id => params[:user_id], :friend_id => current_user.id, :status => 'pending'}
		if @friendship1.save && @friendship2.save
			redirect_to users_path
		else
			redirect_to users_path
		end
	end

	def update
		Friend.find_by(user_id: current_user.id, friend_id: params[:user_id]).update_attribute(:status, "accepted")
		Friend.find_by(user_id: params[:user_id], friend_id: current_user.id).update_attribute(:status, "accepted")
		redirect_to users_path
	end

	def destroy
		Friend.find_by(user_id: current_user.id, friend_id: params[:user_id]).destroy
		Friend.find_by(user_id: params[:user_id], friend_id: current_user.id).destroy
		redirect_to users_path
	end

end
