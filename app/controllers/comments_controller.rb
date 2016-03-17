class CommentsController < ApplicationController

	def create
		@comment = current_user.comments.build(comment_params)
		if @comment.save
			flash[:success] = "Comment added!"
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	def destroy
	end


	private

		def comment_params
			params.require(:comment).permit(:content, :post_id)
		end

end
