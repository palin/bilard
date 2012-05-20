# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_user

  helper_method :current_user_session, :current_user, :check_edit_rights, :deny_access, :authorized_owner?, :authorized_normal_user?, :logged_owner?, :logged_normal_user?, :logged_admin?

  def check_edit_rights
    redirect_to root_path, :alert => "Nie masz dostępu" unless user_allowed?
  end

  def authorized_owner?
    user_allowed? and @user.owner?
  end

  def authorized_normal_user?
    user_allowed? and @user.normal_user?
  end

  def logged_normal_user?
    current_user and current_user.normal_user?
  end

  def logged_owner?
    current_user and current_user.owner?
  end

  def logged_admin?
    current_user and current_user.admin?
  end

  def user_allowed?
    @user == current_user
  end

  private

    def find_user
      @user = User.find_by_id(params[:id])
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
end
