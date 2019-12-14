class FavoritesController < ApplicationController
  def create
    folder = Folder.find(params[:folder_id])
    current_user.like(folder)
    flash[:success] = 'お気に入りに登録しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    folder = Folder.find(params[:folder_id])
    current_user.unlike(folder)
    flash[:success] = 'お気に入りから削除しました'
    redirect_back(fallback_location: root_path)
  end
end
