class PostsController < ApplicationController

	def index 
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		post_params = params.require(:post).permit(:title, :body)
		@post = Post.new post_params

		if @post.save
			redirect_to post_path(@post)
		else
			flash[:notice] = "Please input"
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end


	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find params[:id]
		post_params = params.require(:post).permit(:title, :body)

		if @post.update post_params
			redirect_to post_path(@post)
		else
			flash[:notice] = "Sorry. There was something wrong with the update"
			render :edit
		end
	end

	def destroy
		@post = Post.find params[:id]
		@post.destroy
		redirect_to posts_path, notice: "Your post has been deleted"
	end

end


