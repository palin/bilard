# -*- encoding : utf-8 -*-
class HomeController < ApplicationController

  def index
    @title = 'Strona główna'
  end

  def prices
    @title = 'Cennik'
    flash[:notice] = "Cennik asd asdsa das das dad noticece"
  end

  def about
    @title = 'O nas'
  end

  def offert
    @title = 'Oferta'
  end

end
