class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_info = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    @user = User.new user_info

    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "Account created!"
    else
      flash[:notice] = "Please fill in the required fields"
      render :new
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    user_info = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)


    if @user.update user_info
      redirect_to root_path, notice: "Your info has been update"
    else
      flash[:notice] = "Please re-check your information"
      render :edit
    end
  end
end
