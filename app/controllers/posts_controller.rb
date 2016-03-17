class PostsController < ApplicationController

	def index
		@posts = Post.find_by(params[:id])
	end

end
