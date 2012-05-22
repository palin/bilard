# -*- encoding : utf-8 -*-
class EmployeesController < ApplicationController

  before_filter :logged_owner_rights_required, :authorized_owner?

  def index
    @title = "Pracownicy"
    @employees = Employee.all
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
