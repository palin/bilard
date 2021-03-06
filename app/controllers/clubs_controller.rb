# -*- encoding : utf-8 -*-
class ClubsController < ApplicationController

  before_filter :logged_owner_rights_required, :authorized_owner?, :except => [:show]
  before_filter :find_club, :only => [:show, :edit, :update, :destroy, :create_tables]
  before_filter :find_owner

  def index
    @title = "Kluby"
    @clubs = current_user.owner.clubs.all
  end

  def new
    @title = "Nowy klub"
    @club = Club.new
  end

  def create
    @club = Club.new(params[:club])
    @club.owner_id = @owner.id
    @owner.update_attribute(:club_count, @owner.club_count+1)
    if @club.save
      redirect_to owner_clubs_path, :notice => "Utworzono klub!"
    else
      flash.now[:alert] = "Utworzenie klubu nie powiodło się!"
      redirect_to new_owner_club_path
    end
  end

  def show
    @title = "Klub #{@club.id}"
    @tables = @club.tables
  end

  def edit
    @title = "Edycja klubu"
  end

  def update
    @club.attributes = params[:club]
    if @club.save
      flash[:notice] = "Pomyślnie zapisano klub!"
      redirect_to owner_clubs_path
    else
      flash.now[:alert] = "Nie udało się zapisać klubu!"
      render :action => :edit
    end
  end

  def destroy
    @club.destroy
    @owner.update_attribute(:club_count, @owner.club_count - 1)
    render :layout => false
  end

  def create_tables
    (1..params[:table_count].to_i).each_with_index do |c, i|
      @club.tables[i] = Table.create(:club_id => @club.id, :owner_id => @owner.id)
    end

    @club.update_attribute(:table_count, @club.table_count + params[:table_count].to_i)
    redirect_to owner_club_path(:id => @club.id), :notice => "Utworzono #{params[:table_count]} stołów!"
  end

  private

  def find_club
    @club = Club.find_by_id(params[:id])
    unless @club
      redirect_to root_path, :alert => "Nie znaleziono klubu"
    end
  end

end
