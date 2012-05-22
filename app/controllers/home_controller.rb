# -*- encoding : utf-8 -*-
class HomeController < ApplicationController

  before_filter :recognize_token, :only => [:get_data, :set_data]
  before_filter :recognize_params, :only => [:get_data]

  def index
    @title = 'Strona główna'

    #flash[:alert] = "asdybasjdbjasdbhasd"   -- WYWOŁANIE ALERTA PRZY URUCHOMIENIU STRONY GŁÓWNEJ
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
    if @owner and @club
      render :json => @club.table_count
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

  def recognize_params
    if params[:club_name] and @owner
      @owner.clubs.each do |c|
        if params[:club_name] == c.name.parameterize
          @club = c
          return @club
        end
      end
    end
  end
end
