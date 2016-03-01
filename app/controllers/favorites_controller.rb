class FavoritesController < ApplicationController
  before_action :authorize


  def create
    post = Post.find params[:post_id]
    user = current_user
    favorite = Favorite.new( user: user, post: post)

    if favorite.save
      redirect_to post_path(post), notice: "Thanks for favoriting!"
    else 
      redirect_to post_path(post), alert: "You have already favorited"
    end
  end

  def destroy
    post = Post.find params[:post_id]
    favorite = current_user.favorites.find params[:id]
    favorite.destroy
    redirect_to post_path(post), notice: "Un-favorited!"
  end
end


def destroy
  campaign = Campaign.find params[:campaign_id]
  like     = current_user.likes.find params[:id]
  like.destroy
  redirect_to campaign_path(campaign), notice: "Like removed!"
end