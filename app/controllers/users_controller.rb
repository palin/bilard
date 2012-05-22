# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  before_filter :logged_user_rights_required, :only => [:show, :edit, :update]
  before_filter :logged_admin_rights_required, :only => [:index, :make_admin, :make_owner, :make_normal_user]
  before_filter :find_user, :only => [:show, :edit, :update, :destroy, :make_admin, :make_owner, :make_normal_user]

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
      current_user_session.destroy if current_user_session
      redirect_to root_path, :notice => 'Utworzono konto. Zaloguj się oraz uzupełnij dane w profilu.'
    else
      redirect_to new_user_path, :alert => 'Nie można utworzyć takiego użytkownika!'
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

  def make_admin
    @user.update_attribute(:role, Role.find(3))
    redirect_to users_path, :notice => "Użytkownik #{@user.login} jest teraz Adminem!"
  end

  def make_owner
    @user.update_attribute(:role, Role.find(2))
    redirect_to users_path, :notice => "Użytkownik #{@user.login} jest teraz Właścicielem!"
  end

  def make_normal_user
    @user.update_attribute(:role, Role.find(1))
    redirect_to users_path, :notice => "Użytkownik #{@user.login} jest teraz zwykłym, szarym użytkownikiem!"
  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
    unless @user
      redirect_to root_path, :alert => "Nie znaleziono użytkownika!"
    end
  end
end
