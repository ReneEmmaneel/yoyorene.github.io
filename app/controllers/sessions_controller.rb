class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @error = "Wrong username or password"
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    redirect_back(fallback_location: 'index#index')
  end

  def login
  end

  def welcome
  end
end
