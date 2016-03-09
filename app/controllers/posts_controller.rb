class PostsController < ApplicationController

	before_action :authorize, only: [:new, :edit, :update]
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index 
		@posts = Post.order(id: :desc)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params
 		@post.user = current_user

		if @post.save
			redirect_to post_path(@post)
		else
			flash[:notice] = "Please input"
			render :new
		end
	end

	def show
		@comment = Comment.new
	end


	def edit
		redirect_to root_path, alert: "access denied" unless can? :edit, @post
	end

	def update
		redirect_to root_path, alert: "access denied" unless can? :edit, @post

		@post.slug = nil
		if @post.update post_params
			redirect_to post_path(@post)
		else
			flash[:notice] = "Sorry. There was something wrong with the update"
			render :edit
		end
	end

	def destroy
		redirect_to root_path, alert: "access denied" unless can? :edit, @post
		@post.destroy
		redirect_to posts_path, notice: "Your post has been deleted"
	end

	private

	def post_params
		params.require(:post).permit(:title, :category_id, :body)
	end

	def find_post
		@post = Post.friendly.find params[:id]
	end

end


