# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  before_filter :check_rights, :only => [:show]

  def index
    @title = "Użytkownicy"
    @users = User.all
  end

  def show
    @title = "Profil właściciela"
    @user = User.find(params[:id])
    @owner = Owner.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save!
      redirect_to users_path, :notice => 'Utworzono konto. Uzupełnij dane w profilu.'
    else
      redirect_to new_user_path, :alert => 'Błędy w formularzu'
    end
  end

  def edit
    @user = current_user
    @owner = @user.owner
  end

  def update

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy if @user

    redirect_to users_path, :alert => "Usunięto użytkownika"
  end

  private

  def check_rights
    @user = User.find_by_id(params[:id])
    redirect_to root_path, :alert => "Nie masz dostępu" unless @user == current_user
  end

end
