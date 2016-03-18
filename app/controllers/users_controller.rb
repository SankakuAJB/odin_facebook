class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@like = Like.new
		@comment = Comment.new
		@post = Post.new
	end

	def index
		@users = User.all 
	end

end
