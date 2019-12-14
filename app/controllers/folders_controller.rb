class FoldersController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit, :update]

  def index
    @folders = Folder.order(id: :desc).page(params[:page]).per(25)
  end

  def new
    @folder = Folder.new
  end

  def show
    @folder = Folder.find(params[:id])
    @quizzes = Quiz.all
  end

  def create
    @folder = current_user.folders.build(folder_params)
    if @folder.save
      flash[:success] = '新規フォルダを作成しました。'
      redirect_to root_path
    else
      @folders = current_user.folders.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'フォルダの作成に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def edit
    @folder = Folder.find(params[:id])
  end
  
  def update
    @folder = Folder.find(params[:id])
    if @folder.update(folder_params)
      flash[:success] = 'フォルダー名を更新しました。'
      redirect_to root_path
    else
      flash.now[:danger] = '正常に更新できませんでした。'
      render 'toppages/index'
    end
  end

  def destroy
    @folder.destroy
    flash[:success] = 'フォルダを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def answers
    @folder = Folder.find(params[:id])
    @quizzes = @folder.quizzes.all
  end
  
  def questions
    @folder = Folder.find(params[:id])
    @quizzes = @folder.quizzes.all
  end
  
  private

  def folder_params
    params.require(:folder).permit(:content)
  end
  
  def correct_user
    @folder = current_user.folders.find_by(id: params[:id])
    unless @folder
      redirect_to root_url
    end
  end
  
end
