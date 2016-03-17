class PostsController < ApplicationController
	before_action :correct_user, only: :destroy

	def index
		@posts = Post.where(user_id: current_user.id)
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "post saved"

			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	def destroy
		@post.destroy
		flash[:success] = "Post and related comments deleted"
		redirect_to root_path
	end


	private

		def post_params
			params.require(:post).permit(:content)
		end

		def correct_user
			@post = current_user.posts.find_by(id: params[:id])
			redirect_to root_url if @post.nil?
		end

end
