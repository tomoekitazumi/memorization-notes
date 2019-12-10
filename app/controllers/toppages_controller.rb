class ToppagesController < ApplicationController
  def index
    if logged_in?
      @folder = current_user.folders.build  # form_with 用
      @folders = current_user.folders.order(id: :desc).page(params[:page])
    end
  end
end
