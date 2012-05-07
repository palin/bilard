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
    @owner = Owner.new(:user => params[:owner][:user] params[:owner][:owner])
    @user = User.new(, :owner_id => @owner.id)
    #@owner.sa
    # @owner = Owner.new(params[:owner][:owner])
    # @user.save
    # raise @user.errors.to_yaml unless @user.errors.empty?
    # @owner.save
    # raise @owner.errors.to_yaml unless @owner.errors.empty?
    if @owner.save!
      redirect_to users_path, :notice => 'Utworzono profil właściciela.'
    else
      redirect_to new_user_path, :alert => 'Błędy w formularzu'
    end
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

end
