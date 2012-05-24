# -*- encoding : utf-8 -*-
class OwnersController < ApplicationController

  before_filter :logged_owner_rights_required, :authorized_owner?, :except => [:new, :create]
  before_filter :find_owner, :except => [:new, :create]
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
    @owner.club_count = 0
    if @owner.save
      @user.owner_id = @owner.id
      @user.role = Role.find(2)
      @user.save!
      redirect_to @owner, :notice => 'Utworzono profil właściciela!'
    else
      flash.now[:alert] = "Nie można utworzyć profilu właściciela!"
      render :action => :new
    end
  end

  def edit
  end

  def update
    @owner.attributes = params[:owner]

    if @owner.save
      flash[:notice] = "Zaktualizowano profil właściciela!"
      redirect_to owner_path(@owner)
    else
      flash.now[:alert] = "Błąd! Nie można zaktualizować profilu właściciela!"
      render :action => :edit
    end
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
    @clubs = @owner.clubs
  end

  def all_tables
    @clubs = @owner.clubs
  end

  def all_employees

  end

  def all_reservations

  end

  def generate_token
    token = new_token
    while !token_unique?(token)
      token = new_token
    end
    current_user.owner.update_attribute(:token, token)
    render :layout => false
  end

  def new_token
    (1..48).map{ %w(A B C D E F G H K L M N P R T U V W Y 0 1 2 3 4 6 7 8 9).sample }.join
  end

  def club_data

  end

  def create_clubs
    (1..params[:club_count].to_i).each_with_index do |c, i|
      @owner.clubs[i] = Club.create(:name => "Klub_#{i}", :owner_id => @owner.id, :table_count => 0)
    end

    @owner.update_attribute(:club_count, @owner.club_count+params[:club_count].to_i)
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
