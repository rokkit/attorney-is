# encoding: UTF-8

class PagesController < ApplicationController
  #before_filter :authenticate_user!
  #load_and_authorize_resource
  def index
    if current_user && current_user.has_role(:admin)
      redirect_to action: :admin
    else
      redirect_to new_user_session_path
    end
  end

  def admin
    @domains = Domain.all
  end
end
