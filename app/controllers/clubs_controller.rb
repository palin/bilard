# -*- encoding : utf-8 -*-
class ClubsController < ApplicationController

  def index
    @title = "Kluby"
    @clubs = current_user.owner.clubs.all
  end

  def show
  end

  def new
    @club = Club.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
