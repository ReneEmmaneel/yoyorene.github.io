class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      @error = "Username is already in use"
      render :new
    else
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
        render :new
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
