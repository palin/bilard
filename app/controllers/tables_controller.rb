# -*- encoding : utf-8 -*-
class TablesController < ApplicationController

  def index
    @title = "Stoły"
    @tables = Table.all
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
