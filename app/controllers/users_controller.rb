class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.save and redirect_to(@user, :notice => 'User was successfully created.')
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user]) ?
        redirect_to(@user, :notice => 'User was successfully updated.') : render(:edit)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy and redirect_to(users_url)
  end
end