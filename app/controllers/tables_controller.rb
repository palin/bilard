# -*- encoding : utf-8 -*-
class TablesController < ApplicationController

  before_filter :logged_owner_rights_required, :authorized_owner?, :find_owner, :find_club, :find_table

  def index
    @title = "Stoły"
    @clubs = @owner.clubs
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @table.destroy
    @club.update_attribute(:table_count, @club.table_count-1)
    render :layout => false
  end

  def find_owner
    @owner = Owner.find_by_id(params[:owner_id])
    unless @owner
      redirect_to root_path, :alert => "Nie znaleziono właściciela!"
    end
  end

  def find_club
    @club = Club.find_by_id(params[:club_id])
    unless @club
      redirect_to root_path, :alert => "Nie znaleziono klubu!"
    end
  end

  def find_table
    @table = Table.find_by_id(params[:id])
    unless @table
      redirect_to root_path, :alert => "Nie znaleziono stołu!"
    end
  end
end