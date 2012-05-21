# -*- encoding : utf-8 -*-
class OwnersController < ApplicationController

  before_filter :authorized_owner?
  before_filter :find_owner, :only => [:show, :edit, :update, :destroy, :create_clubs]
  before_filter :find_user

  def index
    @title = "Właściciele"
    @owners = Owner.all
  end

  def show
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(params[:owner])
    @owner.user_id = @user.id
    @owner.save!

    @user.owner_id = @owner.id
    @user.role = Role.find(2)
    @user.save!

    redirect_to @owner, :notice => 'Utworzono profil właściciela'
  end

  def edit
  end

  def update
    @owner.attributes = params[:owner]

    if @owner.save
      flash[:notice] = "Zaktualizowano profil właściciela!"
    else
      flash[:alert] = "Błąd! Nie można zaktualizować profilu właściciela!"
    end

    redirect_to owner_path(@owner)
  end

  def destroy
    if @owner.destroy
       flash[:notice] = 'Usunięto właściciela'
    else
      flash[:alert] = 'Nie znaleziono takiego właściciela. Być może został usunięty wcześniej.'
    end

    redirect_to owners_path
  end

  def all_clubs

  end

  def all_tables

  end

  def all_employees

  end

  def all_reservations

  end

  def generate_token
    token = (1..48).map{ %w(A B C D E F G H K L M N P R T U V W Y 0 1 2 3 4 6 7 8 9).sample }.join

    while !token_unique?(token)
      token = (1..48).map{ %w(A B C D E F G H K L M N P R T U V W Y 0 1 2 3 4 6 7 8 9).sample }.join
    end

    current_user.owner.update_attribute(:token, token)

    render :layout => false
  end

  def club_data

  end

  def create_clubs
    @owner.update_attribute(:club_count, params[:club_count])
    (1..@owner.club_count).each_with_index do |c, i|
      @owner.clubs[i] = Club.create(:name => "Klub_#{i}", :owner_id => @owner.id)
    end

    redirect_to all_clubs_owner_path, :notice => "Utworzono #{params[:club_count]} klubów!"
  end

  private

  def find_owner
    @owner = Owner.find_by_id(params[:id])
    unless @owner
      redirect_to root_path, :alert => "Nie znaleziono właściciela!"
    end
  end

  def find_user
    @user = current_user
  end

  def token_unique?(token)
    Owner.all.each do |o|
      if o.token.present? and o.token == token
        return false
      end
    end
    true
  end
end
