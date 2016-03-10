class CommentsController < ApplicationController

	def create
		@post = Post.friendly.find (params[:post_id])
		comment_params = params.require(:comment).permit(:body)
		@comment = Comment.new comment_params
		@comment.post = @post
		@comment.user = current_user

		respond_to do |format|
			if @comment.save
				format.html { CommentsMailer.notify_post_owner(@comment).deliver_later
											redirect_to @comment.post, notice: "Comment made"}
				format.js { render :create_success }
			else 
				format.html { render "posts/show" }
				format.js		{ render :create_failure } 
			end
		end
	end

	def destroy
		@comment = Comment.find params[:id]
		@comment.destroy
		respond_to do |format|
			format.html { redirect_to post_path(params[:post_id]), notice: "Comment deleted" }
			format.js { render :delete_success }
		end
	end

end




# if @answer.save
#       format.html { redirect_to question_path(@question), notice: "Answer created successfully!" }
#       format.js { render :create_success }
#     else
#       format.html { render "questions/show" }
#       format.js   { render :create_failure }
#     end