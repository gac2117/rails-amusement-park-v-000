class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id].destroy
    redirect_to root_url
  end

end
