# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
        flash[:notice] = "Доступ к этому разделу ограничен"
        redirect_to root_url
  end
end
