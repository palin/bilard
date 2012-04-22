# -*- encoding : utf-8 -*-
class HomeController < ApplicationController

  def index
    @title = 'Strona główna'
  end

  def prices
    @title = 'Cennik'
  end

  def about
    @title = 'O nas'
  end

  def offert
    @title = 'Oferta'
  end

end
