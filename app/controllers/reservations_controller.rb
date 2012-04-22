# -*- encoding : utf-8 -*-
class ReservationsController < ApplicationController

  def index
    @title = "Rezerwacje"
    @reservations = Reservations.all
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
