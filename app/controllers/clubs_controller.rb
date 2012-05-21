# -*- encoding : utf-8 -*-
class ClubsController < ApplicationController

  before_filter :find_club, :only => [:show, :edit, :update, :destroy]
  before_filter :find_owner

  def index
    @title = "Kluby"
    @clubs = current_user.owner.clubs.all
  end

  def show
    @title = "Klub #{@club}"
  end

  def new
    @title = "Nowy klub"
    @club = Club.new
  end

  def create
    @club = Club.create(:owner_id => @owner.id)
    if @club.save
      redirect_to owner_clubs_path, :notice => "Utworzono klub!"
    else
      redirect_to new_owner_club_path, :alert => "Utworzenie klubu nie powiodło się!"
    end
  end

  def edit
    @title = "Edycja klubu"
  end

  def update
    @club.update(params[:club])
  end

  def destroy
    @club.destroy if @club
    render :layout => false
  end

  private

  def find_club
    @club = Club.find(params[:id])
  end

end
