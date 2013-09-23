# encoding: UTF-8

class PagesController < ApplicationController
  before_filter :authenticate_user!
  def index
      redirect_to action: :admin
  end

  def admin
    @domains = Domain.all
  end
end
