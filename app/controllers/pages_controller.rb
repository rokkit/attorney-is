# encoding: UTF-8

class PagesController < ApplicationController
  #before_filter :authenticate_user!
  #load_and_authorize_resource
  def index
      redirect_to action: :admin
  end

  def admin
    @domains = Domain.all
  end
end
