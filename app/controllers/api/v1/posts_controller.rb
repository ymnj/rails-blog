class Api::V1::PostsController < ApplicationController
  before_action :default_serializer_options

  def index
    @posts = Post.order(id: :desc)
    render json: @posts
  end

  def show
    @post = Post.friendly.find params[:id]
    render json: @post
  end


  def default_serializer_options
    {root: false}
  end

end

