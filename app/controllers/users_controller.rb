# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  def index
    @title = "Użytkownicy"
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @owner = Owner.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy if @user

    redirect_to users_path, :alert => "Usunięto użytkownika"
  end

end
