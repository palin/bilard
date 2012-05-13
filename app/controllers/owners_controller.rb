# -*- encoding : utf-8 -*-
class OwnersController < ApplicationController

  def index
    @title = "Właściciele"
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.create(params[:owner])
    @owner.user_id = current_user.id
    @owner.save!
    current_user.owner_id = @owner.id
    current_user.save!
    redirect_to current_user, :notice => 'Utworzono profil właściciela'
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find_by_id(params[:id])
    if @owner
      @owner.update_attributes(params)
      redirect_to owner_path(@owner)
    end
  end

  def destroy
    @owner = Owner.find_by_id(params[:id])
    if @owner
      @owner.destroy
      redirect_to owners_path, :notice => 'Usunięto właściciela'
    else
      redirect_to owners_path, :alert => 'Nie znaleziono takiego właściciela. Być może został usunięty wcześniej.'
    end
  end

  def generate_token
    token = (1..48).map{ %w(A B C D E F G H K L M N P R T U V W Y 0 1 2 3 4 6 7 8 9).sample }.join
    current_user.owner.update_attribute(:token, token)
    redirect_to user_path(current_user), :notice => "Utworzono nowy token!"
  end

end
