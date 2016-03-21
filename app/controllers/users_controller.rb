class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@like = Like.new
		@comment = Comment.new
		@post = Post.new
	end

	def index
		@users = User.all 
		@friends = Friend.where(:user_id => current_user.id)
	end

end
