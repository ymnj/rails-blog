class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "Account created!"
    else
      flash[:notice] = "Please fill in the required fields"
      render :new
    end
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)

    if valid_new_password && @user.authenticate(params[:old_password])
        if @user.update user_params
          redirect_to root_path, notice: "Information updated!"
        else
          render :edit
        end
    else
      flash[:alert] = "Please re-check your information"
      render :edit
    end
  end #END UPDATE




  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)    
  end


  def valid_new_password
    params[:old_password] != params["user"]["password"] && params["user"]["password"] == params["user"]["password_confirmation"]
  end

end
