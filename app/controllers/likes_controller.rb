class LikesController < ApplicationController

	def create
		@like = current_user.likes.build
		@like.post_id = params[:post_id]
		if @like.save
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	def destroy
	end


	private


end


