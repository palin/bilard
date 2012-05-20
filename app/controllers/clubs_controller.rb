# -*- encoding : utf-8 -*-
class ClubsController < ApplicationController

  before_filter :find_club, :only => [:show, :edit, :update, :destroy]

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
    @club = Club.new(params[:club])
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

    redirect_to owner_clubs_path, :alert => "Usunięto klub!"
  end

  private

  def find_club
    @club = Club.find(params[:id])
  end

end
