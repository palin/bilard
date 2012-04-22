# -*- encoding : utf-8 -*-
class EmployeesController < ApplicationController
  
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
