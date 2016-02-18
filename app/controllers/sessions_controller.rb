class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Thank you for logging in"
    else
      flash[:notice] = "Please input valid username and password"
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end
end

# if params[:email] && params[:password]
#       valid_user = User.find_by_email params[:email]
#       if valid_user
#         authorized_user = valid_user.authenticate(params[:password])
#       end
#     else
#       flash[:notice] = "Please input a valid username && password"
#       render :new
#     end

#     if authorized_user
#       session[:user_id] = valid_user.id
#       session[:username] = valid_user.first_name + " " + valid_user.last_name
#       flash[:notice] = "Thank you for logging in " + session[:username]
#       redirect_to posts_path 
#     else
#       flash[:notice] = "Sorry, invalid username & password"
#       render :new
#     end








# def attemp_login
#         if params[:username].present? && params[:password].present?
#             found_user = AdminUser.where(:username => params[:username]).first
#             if found_user
#                 authorized_user = found_user.authenticate(params[:password])
#             end
#         end
#         if authorized_user
#             session[:user_id] = authorized_user.id
#             session[:username] = authorized_user.username
#             flash[:notice] = "You are now logged in"
#             redirect_to(:action => "menu")
#         else
#             flash[:notice] = "invalid username password"
#             redirect_to(:action => "login")
#         end
#     end

#     def logout
#         session[:user_id] = nil
#         session[:username] = nil
#         flash[:notice] = "Successfully logged out"
#         redirect_to(:action => "login")
#     end