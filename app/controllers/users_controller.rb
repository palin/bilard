# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  before_filter :check_edit_rights, :only => [:show, :edit, :update]
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]

  def index
    @title = "Użytkownicy"
    @users = User.all
  end

  def show
    @title = "Profil użytkownika"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    @user.role = Role.find(1)
    if @user.save!
      redirect_to users_path, :notice => 'Utworzono konto. Uzupełnij dane w profilu.'
    else
      redirect_to new_user_path, :alert => 'Błędy w formularzu'
    end
  end

  def edit
  end

  def update
    @user.attributes = params[:user]

    if @user.save
      flash[:notice] = "Zaktualizowano profil!"
    else
      flash[:alert] = "Błąd! Nie można zaktualizować profilu!"
    end

    redirect_to user_path(current_user)
  end

  def destroy
    if @user.destroy
      flash[:alert] = "Usunięto użytkownika!"
    else
      flash[:alert] = "Usunięcie użytkownika nie było możliwe!"
    end
    redirect_to users_path
  end

  def all_clubs
    @clubs = Club.all
  end

  def reservations

  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
    unless @user
      redirect_to root_path, :alert => "Nie znaleziono użytkownika!"
    end
  end
end
