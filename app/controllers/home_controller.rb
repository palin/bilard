# -*- encoding : utf-8 -*-
class HomeController < ApplicationController

  before_filter :recognize_token, :only => [:get_data, :set_data]

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

  def get_data
    if @owner
      recognize_request_and_response
      render_to_string :json => @owner
    else
      params[:errors] = "[500] Token nie został rozpoznany."
    end
  end

  def set_data
    if @owner

    else
      params[:errors] = "[500] Token nie został rozpoznany."
    end
  end

  private

  def recognize_token
    User.all.each do |u|
      if u.owner and u.owner.token == params[:token]
        @owner = u.owner
        return @owner
      end
    end
    nil
  end

  def recognize_request_and_response

  end
end
