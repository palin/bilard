# -*- encoding : utf-8 -*-
class ClubsController < ApplicationController
  
  def index
    @title = "Kluby"
    @clubs = Clubs.all
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
  end

end
