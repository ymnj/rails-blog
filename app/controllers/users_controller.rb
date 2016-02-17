class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_info = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user = User.new user_info

    if @user.save
      redirect_to posts_path @user, notice: "Thank you for login in"
    else
      render :signup, notice: "Please sign up"
    end
  end
end
