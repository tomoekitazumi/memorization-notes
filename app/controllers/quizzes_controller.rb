class QuizzesController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @quiz = Quiz.new
    @folders = current_user.folders.order(id: :desc).page(params[:page])
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      flash[:success] = '新しい問題を作成しました。'
      redirect_to root_path
    else
      flash.now[:danger] = '問題の作成に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
    @folders = current_user.folders.order(id: :desc).page(params[:page])
  end
  
  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      flash[:success] = '問題を更新しました。'
      redirect_to root_path
    else
      flash.now[:danger] = '正常に更新できませんでした。'
      render 'toppages/index'
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    flash[:success] = '問題を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
 
  
  private
  
  def quiz_params
    params.require(:quiz).permit(:question, :answer, :explanation, :folder_id)
  end
  
end
