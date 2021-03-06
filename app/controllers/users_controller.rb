class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)
    if @user.save
       session[:user_id]=@user.id
       session[:user_name]=@user.username
       redirect_to '/'
     else
       redirect_to '/signup'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:full_name,:last_name,:username,:password_digest)
  end
end
