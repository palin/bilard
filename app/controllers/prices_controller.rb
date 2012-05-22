# -*- encoding : utf-8 -*-
class PricesController < ApplicationController

  before_filter :logged_owner_rights_required, :authorized_owner?

  def index
    @title = "Ceny"
    @prices = Price.all
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
