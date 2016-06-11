class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find(params[:user][:id])

    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :back
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
