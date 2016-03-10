class FavoritesController < ApplicationController
  before_action :authorize


  def create
    @post = Post.friendly.find params[:post_id]
    user = current_user
    favorite = Favorite.new( user: user, post: @post)

    respond_to do |format|
      if favorite.save
        format.html { redirect_to post_path(@post), notice: "Thanks for favoriting!" }
        format.js { render :success_favorite }
      else 
        redirect_to post_path(@post), alert: "You have already favorited"
        format.js { render :fail_favorite }
      end
    end
  end

  def destroy
    @post = Post.friendly.find params[:post_id]
    favorite = current_user.favorites.find params[:id]
    favorite.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "Un-favorited!" }  
      format.js { render }
    
    end
  end
  
end


