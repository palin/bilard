# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  
  def index
    @title = "Użytkownicy"
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
